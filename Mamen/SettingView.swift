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
                        Text("Manen v1.10")
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

struct SettingElementView: View {
    var icon: String
    var name: String
    var color: Color

    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .fontWeight(.light)
                .foregroundColor(.black)
            Text(name)
                .font(.custom("AirbnbCereal_W_Bk", size: 17))
                .foregroundColor(.black)
                .padding(.leading, 7)
            Spacer()
        }
        .padding([.top, .leading])
    }
}

struct Divider_Person: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 350, height: 1)
                .foregroundColor(Color(hex: "DDDDDD"))
            
        }
    }
}
