//
//  ThirdScreen.swift
//  Lection 38
//
//  Created by Антон Нарижный on 5.09.22.
//

import SwiftUI

struct Info: Hashable, Identifiable {
    let id = UUID()
    let text: String
}

struct ThirdScreen: View {
    
    var array = [Info(text: "Text1"), Info(text: "Text2"), Info(text: "Click")]
    var body: some View {
        List {
            ForEach(array, content: { item in
                NavigationLink {
                    ThirdScreen()
                } label: {
                    Text(item.text)
                }
            })
        }
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
