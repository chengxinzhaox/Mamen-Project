//
//  MamenApp.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

@main
struct MamenApp: App {
    
    @AppStorage("islogined") var islogined=false
    
    var body: some Scene {
        WindowGroup {
            
            if islogined{
                ContentView()
            }
            else{
                LoginPage()
            }
        }
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "main-green") ?? UIColor.systemRed]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "main-green") ?? UIColor.systemRed]
        navBarAppearance.backgroundColor = .clear
        //navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
