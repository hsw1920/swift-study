//
//  ChatManager.swift
//  iOSChitChat
//
//  Created by 홍승완 on 2022/12/22.
//

import Foundation
import StreamChat
import StreamChatUI
import UIKit

final class ChatManager {
    static let shared = ChatManager()
    
    private var client: ChatClient!
    
    private let tokens = [
        "stevejobs" :  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3RldmVqb2JzIn0.LJzk7nPQOvTNYzU__CLl9agHBlJlK2klvPqTFF-PxTc",
        "markz" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFya3oifQ.TQrdNoulZWFW3ms3nnbSkSbwVEkt0JtJXA_YW2YbShY",
    ]
    func setUp() {
        let client = ChatClient(config: .init(apiKey: .init("8q2nptzzgn23")))
        self.client = client
    }
    
    // Authentication
    
    func signIn(with username: String, completion: @escaping (Bool) -> Void) {
        guard !username.isEmpty else {
            completion(false)
            return
        }
        
        guard let token = tokens[username.lowercased()] else {
            completion(false)
            return
        }
        
        client.connectUser(
            userInfo: UserInfo(id: username, name: username),
            token: Token(stringLiteral: token)
        ) { error in
            completion(error == nil)
        }
    }
     
    func signOut() {
        client.disconnect()
        client.logout()
    }
    
    var isSignedIn: Bool {
        return client.currentUserId != nil
    }
    
    public var currentUser: String? {
        return client.currentUserId
    }
    
    // ChannelList + Creation
    
    public func createChannelList() -> UIViewController? {
        guard let id = currentUser else { return nil }
        let list = client.channelListController(query: .init(filter: .containMembers(userIds: [id])))
        
        let vc = ChatChannelListVC()
        vc.content = list
        list.synchronize()
        return vc
    }
    
    public func createNewChannel(name: String) {
        guard let current = currentUser else {
            return
        }
        let keys: [String] = tokens.keys.filter({ $0 != current }).map{ $0 }

        do {
            let result = try client.channelController(
                createChannelWithId: .init(type: .messaging, id: name),
                name: name,
                members: Set(keys),
                isCurrentUserMember: true
            )
            result.synchronize()
        }
        catch {
            print("\(error)")
        }
    }
    
}
