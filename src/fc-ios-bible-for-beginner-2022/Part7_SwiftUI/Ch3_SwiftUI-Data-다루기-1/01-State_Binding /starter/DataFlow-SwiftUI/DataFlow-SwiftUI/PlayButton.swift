//
//  PlayButton.swift
//  DataFlow-SwiftUI
//
//  Created by 홍승완 on 2023/03/18.
//

import SwiftUI

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle": "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}
