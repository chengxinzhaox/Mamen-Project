//
//  ContentView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var select: Int = 1
    
    init() {
        UITabBar.appearance().backgroundColor = .white
        }

    var body: some View {
        NavigationView {
            TabView(selection: $select) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
                Course()
                    .tabItem {
                        Label("Course", systemImage: "book")
                    }
                    .tag(2)
                    CalendarView()
                    .tabItem {
                        Label("Calender", systemImage: "calendar")
                    }
                    .tag(3)

                Person().offset(y: 40)
                    .tabItem {
                        Label("Me", systemImage: "person")
                    }
                    .tag(4)

            }
            .accentColor(Color("main-green")) //text color
            .onChange(of: self.select) { _ in
                TapticEngine.impact.feedback(.medium)
            }
        }
//        .background(Material.ultraThin)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif
