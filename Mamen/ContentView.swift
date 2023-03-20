//
//  ContentView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import AxisTabView
import SwiftUI

struct ContentView: View {
    
    @State private var select: Int = 1

    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    let naviTitle = ["Home", "", "", ""]
    var body: some View {
        NavigationView {
            TabView(selection: $select) {
                HomeView()
                    .tabItem {
                        Label("", image: select==1 ? "Home_on" : "Home")
                    }
                    .tag(1)
                Course()
                    .tabItem {
                        Label("", image: select==2 ? "Course_on" : "Course")
                    }
                    .tag(2)
                CalendarView()
                    .tabItem {
                        Label("", image: select==3 ? "Calendar_on" : "Calendar")
                    }
                    .tag(3)

                Person().offset(y: 40)
                    .tabItem {
                        Label("", image: select==4 ? "Person_on" : "Person")
                    }
                    .tag(4)
            }
            .navigationTitle(Text(naviTitle[select-1]))
            //.navigationViewStyle(StackNavigationViewStyle())
            .accentColor(Color("main-green")) // text color
            .onChange(of: self.select) { _ in
                TapticEngine.impact.feedback(.medium)
            }
        }
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
