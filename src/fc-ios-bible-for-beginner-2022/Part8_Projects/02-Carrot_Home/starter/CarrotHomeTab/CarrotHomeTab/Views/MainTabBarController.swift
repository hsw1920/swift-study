//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by 홍승완 on 2023/06/06.
//

import UIKit

// [✅] 탭이 눌릴때마다, 그에 맞는 네비게이션 바를 구성해야함
// [✅] - 탭이 눌리는 것을 감지 해야겠다
// [✅] - 탭을 감지 후에, 그 탭에 맞게 네비게이션 바 구성을 업데이트 해주기


// 탭이 시작할 때, 네비게이션바 아이템 설정을 완료하고 싶다.
// - 네비게이션 바를

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavifationItem(vc: self.selectedViewController!)

    }
    
    private func updateNavifationItem(vc: UIViewController) {
        print(vc)
        switch vc {
        case is HomeViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass")) {
                print("--> search tapped")
            }
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.backButtonDisplayMode = .minimal
            
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape")) {
                print("--> setting tapped")
            }
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [searchItem]
            navigationItem.backButtonDisplayMode = .minimal
        default:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.backButtonDisplayMode = .minimal
        }
    }
    

}

// [✅] 각 탭에 맞게 네비게이션 바 아이템 구성하기
// -[✅] 홈: 타이틀, 피드, 서치
// -[✅] 동네활동: 타이틀, 피드
// -[✅] 내 근처: 타이틀, 피드
// -[✅] 채팅: 타이틀, 피드
// -[✅] 나의 당근: 타이틀, 설정

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch viewController {
        case is HomeViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass")) {
                print("--> search tapped")
            }
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
            
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape")) {
                print("--> setting tapped")
            }
            let searchItem = UIBarButtonItem.generate(
                with: searchConfig
            )
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [searchItem]
            navigationItem.backButtonDisplayMode = .minimal
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            
            let titleItem = UIBarButtonItem.generate(
                with: titleConfig
            )
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell")) {
                print("--> feed tapped")
            }
            let feedItem = UIBarButtonItem.generate(
                with: feedConfig,
                width: 30
            )
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        }
    
        
    }
        
}
