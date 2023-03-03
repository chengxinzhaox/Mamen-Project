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
                Section {
                    NavigationLink(destination:
                        LibaryView()
                            .navigationTitle("Perosnal Information")
                    ) {
                        SettingElementView(icon: "person.fill", name: "Perosnal Information", color: Color(hex: "FFA61E"))
                    }

                }
//            header: {
//                    Text("personal strring")
//                }
                Section {
                    HStack {
                        Spacer()
                        Text("Log Out")
                            .foregroundColor(.red)
                        Spacer()
                    }
                } footer: {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image("SettingLogo")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Spacer()
                        }
                        .padding(.bottom, -4.0)
                        HStack {
                            Text("Manen v1.08")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                                .fontWeight(.semibold)
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.accentColor)
                        }
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
                .frame(width: 35, height: 35)
                .foregroundColor(color)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 19))
                        .foregroundColor(.white)
                }
            Text(name)
        }
    }
}
