//
//  LiangView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/22/22.
//

import SwiftUI

struct LiangView: View {
    
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
                            Image("leon")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                        Text("Leno Liang")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        Text("Software Development with C and Cpp")
                            .font(.system(size: 15))
                            .offset(y: 4)
                            .fontWeight(.medium)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.786))
                    }
                    .padding(.top, 90)
                    .padding(.leading, 20)
                    Spacer()
                }
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20, style: .continuous )
                .fill(Color(hex: "FFFFFF"))
                .frame(height: 600)
                .shadow(radius: 4.0)
                .ignoresSafeArea()
                .offset(y: 170)
            VStack {
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer()
                        HStack {
                            Text("Contact")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main-green"))
                                .padding(.top, 10)
                                .padding(.leading, 25)
                            Spacer()
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .continuous )
                                .fill(Color.white)
                                .frame(width: 350, height: 55)
                                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                            HStack {
                                Text("E-mail")
                                    .font(.system(size: 15))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.gray)
                                    .offset(x: -65)

                                Text("leno@zy.cdut.cn")
                                    .font(.system(size: 15))
                                    .fontWeight(.medium)
                                    .offset(x: 55)
                            }
                        }

                        HStack {
                            Text("Office")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main-green"))
                                .padding(.top, 5)
                                .padding(.leading, 25)
                            Spacer()
                        }
                        .offset(y: 15)
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("WORK TIME")
                                        .font(.system(size: 13))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.gray)
                                        .padding(.top, 10)
                                }
                                HStack {
                                    Text("9:00AM - 7:00PM")
                                        .font(.system(size: 10))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("OFFICE LOCATION")
                                    .font(.system(size: 13))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                    .padding(.top, 10)
                                Text("8 Building, CDUT")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.trailing, 35)
                        }
                        .padding(.leading, 25)
                        .padding(.bottom, 10)
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

struct LiangView_Previews: PreviewProvider {
    static var previews: some View {
        LiangView()
    }
}
