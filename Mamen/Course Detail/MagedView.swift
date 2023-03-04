//
//  MagedView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct MagedView: View {
    @Environment(\.dismiss) var dismiss
    @State var showMap = false

    var body: some View {
        ZStack {
            VStack {
                Image("Liang_back")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 500)
                    .ignoresSafeArea()
                Spacer()
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        ZStack {
                            Image("maged")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                        Text("Maged Refat")
                            .font(.custom("AirbnbCereal_W_Bd", size:30))
                            .foregroundColor(Color.white)
                        Text("Databases")
                            .font(.custom("AirbnbCereal_W_Md", size:15))
                            .offset(y:4)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.786))
                    }
                    .padding(.top, 90)
                    .padding(.leading, 20)
                    Spacer()
                }
                Spacer()
            }
            Rectangle()
                .fill(Color(hex: "FFFFFF"))
                .frame(height: 600)
                .cornerRadius(20)
                .shadow(radius: 4.0)
                .ignoresSafeArea()
                .offset(y: 170)
            VStack {
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer()
                        HStack {
                            Text("Contect")
                                .font(.custom("AirbnbCereal_W_Bd", size:18))
                                .foregroundColor(Color("main-green"))
                                .padding(.top, 10)
                                .padding(.leading, 25)
                            Spacer()
                        }
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 350, height: 55)
                                .cornerRadius(15)
                                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                            HStack {
                                Text("E-mail")
                                    .font(.custom("AirbnbCereal_W_Bd", size:15))
                                    .foregroundColor(Color.gray)
                                    .offset(x: -65)

                                Text("maged@zy.cdut.cn")
                                    .font(.custom("AirbnbCereal_W_Md", size:15))
                                    .offset(x: 55)
                            }
                        }
                        HStack {
                            Text("Office")
                                .font(.custom("AirbnbCereal_W_Bd", size:18))
                                .foregroundColor(Color("main-green"))
                                .padding(.top, 5)
                                .padding(.leading, 25)
                            Spacer()
                        }
                        .offset(y:15)
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("WORK TIME")
                                        .font(.custom("AirbnbCereal_W_Bd", size:13))
                                        .foregroundColor(Color.gray)
                                        .padding(.top, 10)
                                }
                                HStack {
                                    Text("9:00AM - 7:00PM")
                                        .font(.custom("AirbnbCereal_W_Md", size:10))
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("OFFICE LOCATION")
                                    .font(.custom("AirbnbCereal_W_Bd", size:13))
                                    .foregroundColor(Color.gray)
                                    .padding(.top, 10)
                                Text("8 Building, CDUT")
                                    .font(.custom("AirbnbCereal_W_Md", size:10))
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.trailing, 35)
                        }
                        .padding(.leading, 25)
                        .padding(.bottom, 15)
                        MapViewNoBack(location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", interactionMode: [])
                            .frame(width: 350, height: 150)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .onTapGesture {
                                self.showMap = true
                                TapticEngine.impact.feedback(.medium)
                            }
                            .sheet(isPresented: $showMap) {
                                MapView(location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China")
                                    .edgesIgnoringSafeArea(.all)
                            }
                            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                    }
                }
                .frame(height: 490)
            }
        }
    }
}

struct MagedView_Previews: PreviewProvider {
    static var previews: some View {
        MagedView()
    }
}

