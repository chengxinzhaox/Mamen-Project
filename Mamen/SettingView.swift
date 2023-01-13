//
//  SettingView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            Text("🧑🏻‍💻")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("main-green"))
                .padding()
            Text("Setting Page")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("main-green"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
