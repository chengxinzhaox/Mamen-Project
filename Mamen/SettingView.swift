//
//  SettingView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct SettingView: View {
    @State var show = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section("Personal setting") {
                    SettingElementView(icon: "person.fill", name: "Perosn", color: .blue)
                }

                Section("Personal setting") {
                    
                    NavigationLink(destination:
                        LibaryView()
                            .navigationTitle("haha")
                    ) {
                        SettingElementView(icon: "person.fill", name: "Perosn", color: .gray)
                    }
                    
                }
            }
            .navigationBarTitle("Setting", displayMode: .inline)
            .toolbar {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.down")
                }
                Spacer()
            }
            .accentColor(Color("main-green"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SettingElementView: View {
    var icon: String
    var name: String
    var color: Color

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .frame(width: 32, height: 32)
                .foregroundColor(color)
                .overlay {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                }
            Text(name)
        }
    }
}
