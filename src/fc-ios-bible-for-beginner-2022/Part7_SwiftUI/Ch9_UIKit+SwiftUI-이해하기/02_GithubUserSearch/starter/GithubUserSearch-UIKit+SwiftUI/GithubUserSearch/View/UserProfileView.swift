//
//  UserProfileView.swift
//  GithubUserSearch
//
//  Created by 홍승완 on 2023/03/26.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {

    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack(spacing: 80) {
            KFImage(viewModel.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
                .background(.gray)
                .cornerRadius(80)
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.name)
                        .font(.system(size: 24, weight: .bold))
                    Text(viewModel.login)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.gray)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.followers)
                    Text(viewModel.following)
                }
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }.onAppear {
            let id = viewModel.loginID
            viewModel.search(keyword: id)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewModel: UserProfileViewModel(network: NetworkService(configuration: .default), loginID: "hsw1920"))
    }
}
