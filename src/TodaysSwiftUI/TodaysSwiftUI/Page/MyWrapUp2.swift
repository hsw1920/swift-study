//
//  MyWrapUp2.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

// Color (다크모드) [new]
// Divider
// sheet, modal
// Alert
// TabView
// onDisappear, onAppear
// progress View
// TextField
// Secure Field
// Toggle
// NavigationView
// 같이 해보는 과제
// NavigationStack
// Label

struct MyWrapUp2: View {
    @State var userID: String = ""
    @State var userPassword: String = ""
    @State var hasLoggedIn: Bool = false
    @State var hasShownPassword: Bool = false
    var body: some View {
        VStack{
            HStack {
                Label {
                    Text("ID : ")
                } icon: {
                    Image(systemName: "person.fill")
                }
                TextField("enter Id", text: $userID)
            }
            
            Divider()
            HStack {
                Label {
                    Text("PW :")
                } icon: {
                    Image(systemName: "lock.fill")
                }
                if hasShownPassword {
                    TextField("enter Password", text: $userPassword)
                } else {
                    SecureField("enter Password", text: $userPassword)
                }
                
                Spacer()
                Toggle(isOn: $hasShownPassword) {
                    Text("Show")
                }
            }
            
            Button {
                if userPassword == "1234",
                   userID == "Wan"
                {
                    hasLoggedIn = true
                } else {
                    hasLoggedIn = false
                }
            } label: {
                Text("Sign in")
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }

        }
        .sheet(isPresented: $hasLoggedIn, content: {
            Text("Hello \(userID)! Welcome!")
        })
        .padding()
    }
}

struct MyWrapUp2_Previews: PreviewProvider {
    static var previews: some View {
        MyWrapUp2()
    }
}
