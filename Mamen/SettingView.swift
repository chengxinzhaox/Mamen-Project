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
            VStack {
                HStack {
                    Text("Setting")
                        .font(.custom("AirbnbCereal_W_Bd", size: 25))
                        .foregroundColor(Color("main-green"))
                    Spacer()
                }
                .padding([.top, .leading, .bottom])
                
                Group{
                    Spacer()
                        .frame(height: 10)
                    Image("Back_illustrate")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 190)
                    
                    Spacer()
                        .frame(height: 40)
                }
                

                NavigationLink(destination:
                    LibaryView()
                        .navigationTitle("Perosnal Information")
                ) {
                    SettingElementView(icon: "Person_Black", name: "Perosnal Information", color: Color(hex: "FFA61E"))
                }

                Divider_Person()
                
                NavigationLink(destination:
                    LibaryView()
                        .navigationTitle("Perosnal Information")
                ) {
                    SettingElementView(icon: "About", name: "About Us", color: Color(hex: "FFA61E"))
                }
                
                Divider_Person()

                HStack {
                    Text("Log Out")
                        .font(.custom("AirbnbCereal_W_Md", size: 15))
                        .foregroundColor(.red)
                    Spacer()
                }
                .padding([.top, .leading])
                Spacer()

                Group {
                    HStack {
                        Spacer()
                        Image("SettingLogo")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Spacer()
                    }
                    .padding(.bottom, -4.0)
                    HStack {
                        Spacer()
                        Text("Manen v1.4.0")
                            .font(.custom("AirbnbCereal_W_Md", size: 12))
                            .foregroundColor(Color.gray)
                            .fontWeight(.semibold)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.accentColor)
                        Spacer()
                    }
                }

                .accentColor(Color("main-green"))
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


