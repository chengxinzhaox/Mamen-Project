//
//  LoginPage.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

struct LoginPage: View {
    // User state judge
    @AppStorage("islogined") var islogined = true
    @State private var gosign = false
    @State private var gologin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // background picture
                Image("Login-choose")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Sign Up button
                    NavigationLink(isActive: $gosign) {
                        signUp()
                            .navigationBarBackButtonHidden(true)
                    }
                    label: {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            
                            .foregroundColor(Color(red: 0.575, green: 0.802, blue: 0.782))
                            .overlay {
                                Text("Sign Up")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 17))
                                    .foregroundColor(Color.white)
                            }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    // Login in button
                    NavigationLink(destination: login().navigationBarBackButtonHidden(true), isActive: $gologin) {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            .foregroundColor(Color.white)
                            .overlay {
                                Text("Login")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 17))
                                    .foregroundColor(Color("main-green"))
                            }
                    }
                    
                }.offset(y: 280)
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
