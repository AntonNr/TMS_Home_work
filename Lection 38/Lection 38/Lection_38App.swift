//
//  Lection_38App.swift
//  Lection 38
//
//  Created by Антон Нарижный on 1.09.22.
//

import SwiftUI

@main
struct Lection_38App: App {
    
    var landmarks = ModelData().landmarks
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
