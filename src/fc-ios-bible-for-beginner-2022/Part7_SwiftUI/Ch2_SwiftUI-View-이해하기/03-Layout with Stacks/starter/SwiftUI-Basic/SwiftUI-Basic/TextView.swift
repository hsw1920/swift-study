//
//  TextView.swift
//  SwiftUI-Basic
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        HStack{
            Spacer()
            Text("SwiftUI")
                .font(.system(size: 40, weight: .bold, design: .default))
            Spacer()
            Spacer()
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
