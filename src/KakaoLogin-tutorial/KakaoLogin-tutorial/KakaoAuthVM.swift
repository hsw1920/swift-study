//
//  KakaoAuthVM.swift
//  KakaoLogin-tutorial
//
//  Created by 홍승완 on 2022/09/27.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoggedIn: Bool = false
    
    lazy var loginStatusInfo: AnyPublisher<String?, Never> = $isLoggedIn.compactMap {
        $0 ? "로그인 상태" : "로그아웃 상태"
    }.eraseToAnyPublisher()
    
    init(){
        print("KakaoAuthVM - init() called")
    }
    
    func kakaoLoginWithApp() async -> Bool {
        
        await withCheckedContinuation { continuation in
            // 카카오톡 앱으로 로그인 인증
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func kakaoLoginWithAccount() async -> Bool {
        
        await withCheckedContinuation{ continuation in
            // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                    }
                }
        }
    }
    
    @MainActor
    func KakaoLogin() {
        print("KakaoAuthVM - KakaoLogin() called")
        
        // async await 사용할 때는 Task block 써야함
        Task {
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                
                // 카카오톡 앱으로 로그인 인증
                isLoggedIn = await kakaoLoginWithApp()
            } else { // 카톡이 설치가 안되어있으면
                // 카카오 계정으로 로그인
                isLoggedIn = await kakaoLoginWithAccount()
            }
        }
    }// login
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                self.isLoggedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation{ continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
}
