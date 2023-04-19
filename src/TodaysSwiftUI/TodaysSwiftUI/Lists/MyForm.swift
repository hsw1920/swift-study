//
//  MyForm.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/19.
//

import SwiftUI

struct MyForm: View {
    var body: some View {
        
        var people: [Person] = [Person(name: "Leeo", imageName: "heart"), Person(name: "Dodo", imageName: "heart.fill"), Person(name: "Olivia", imageName: "bolt")]
        
//        List(people) { person in
//            HStack{
//                Image(systemName: person.imageName)
//                Text(person.name)
//            }
//        }
        
        
        /// Form보다는 List 쓰는게 나을듯
        
        Form {
            Section {
                HStack{
                    Image(systemName: "heart")
                    Text("Leeo")
                }
            }
            HStack{
                Image(systemName: "heart.fill")
                Text("Dodo")
            }
            HStack{
                Image(systemName: "bolt")
                Text("Olivia")
            }
        }
    }
}

struct Person: Identifiable{
    var id = UUID()
    let name: String
    let imageName: String
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
