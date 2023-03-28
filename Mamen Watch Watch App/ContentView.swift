//
//  ContentView.swift
//  Mamen Watch Watch App
//
//  Created by Chester Zhao on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var select: Int = 1
    
    var body: some View {
        TabView(selection: $select){
            DeadlineView()
                .tag(1)
            CalendarView()
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
