//
//  CircleImageView.swift
//  SwiftUI_Image_tutorial
//
//  Created by 홍승완 on 2023/04/14.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        Image("myImage")
            .resizable()
            //.aspectRatio(contentMode: .fill) 아래와 같음
                .scaledToFill()
                .frame(width: 300, height: 300)
                //.clipped()
                .clipShape(Circle())
                .shadow(color: .gray, radius: 10, x: 5, y: 10)
                .overlay(
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.4)
                )
                .overlay(
                    Circle().stroke(Color.red, lineWidth: 10)
                        .padding()
                )
                .overlay(
                    Circle().stroke(Color.yellow, lineWidth: 10)
                        .padding(30)
                )
                .overlay(
                    Circle().stroke(Color.blue, lineWidth: 10)
                )
                .overlay(
                    Text("호호호")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        
                )
            //.edgesIgnoringSafeArea(.all)
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 2, y: 4)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
