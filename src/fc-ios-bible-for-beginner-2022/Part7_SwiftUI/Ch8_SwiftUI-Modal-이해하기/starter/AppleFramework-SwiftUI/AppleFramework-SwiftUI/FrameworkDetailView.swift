//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by 홍승완 on 2023/03/26.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold, design: .default))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular, design: .default))
            Spacer()
            Button {
                print("Safari 띄우기")
                viewModel.isSafaroPresented = true
            } label: {
                Text("Learn more")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isSafaroPresented) {
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
        FrameworkDetailView(viewModel: vm)
    }
}
