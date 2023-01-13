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
    
    // main body
    var body: some View {
        NavigationView {
            ZStack {
                // background picture
                Image("Login-choose")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Sign up button
                    NavigationLink(isActive: $gosign) {
                        signUp()
                            .navigationBarBackButtonHidden(true)
                    }
                    label: {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .overlay(){
                                Text("Sign Up")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color("main-green"))
                                    .fontWeight(.bold)
                            }
//                            .foregroundColor(Color(red: 0.575, green: 0.802, blue: 0.782))
                    }
                    
                    Spacer().frame(height: 15)
                    
                    // Login in button
                    NavigationLink(destination: login().navigationBarBackButtonHidden(true), isActive: $gologin) {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            .foregroundColor(Color(red: 0.575, green: 0.802, blue: 0.782))
                            .overlay(){
                                Text("Login")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
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
