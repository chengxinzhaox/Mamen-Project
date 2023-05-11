//
//  SwiftUIView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

struct signUp: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username=""
    @State private var password=""
    @State private var isshow=false
    

    var body: some View {
        NavigationView {
            ZStack {
                Image("Login")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onTapGesture {
                        hideKeyboard()
                    }
                VStack {
                    Spacer()
                        .frame(height: 120)
                    Group {
                        Text("Register")
                            .font(.custom("AirbnbCereal_W_Bd", size: 37))
                            .foregroundColor(Color("main-green"))
                            .padding(.bottom, 2)
                        Text("Create your account")
                            .font(.custom("AirbnbCereal_W_Bd", size: 17))
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    }
                    Spacer()
                        .frame(height: 50)
                    S_input_ID(id: $username)
                    Spacer()
                        .frame(height: 20)
                    
                    S_input_pwd(pwd: $password)
                        
                    Spacer()
                        .frame(height: 10)

                    Button {
                        if !self.Check(username: self.username, password: self.password) {
                            TapticEngine.notification.feedback(.error)
                            self.isshow.toggle()
                        }
                        if self.Check(username: username, password: password) {
                            r.UserResign(username: username, password: password, name: "User\(Int.random(in: 1000...99999))") { result in
                                if result.result==0{
                                    ProgressHUD.showError("Username Repeated")
                                }else{
                                    self.presentationMode.wrappedValue.dismiss()
                                    ProgressHUD.showSucceed("Register successfully")
                                }
                            }
                        }
                        

                    } label: {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            .foregroundColor(Color(red: 0.575, green: 0.802, blue: 0.782))
                            .overlay {
                                Text("Sign Up")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 17))
                                    .foregroundColor(Color.white)
                            }
                    }
                    .offset(y: 100)
                }
                .padding(30)
                .offset(y: 50)
                .alert(isPresented: $isshow) {
                    Alert(title: Text("Please check your input"), dismissButton: .default(Text("Done")))
                }
                VStack {
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("Back_Arrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 37)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(30)
                .padding(.top, 30)
            }
        }
    }

    private func Check(username: String, password: String)->Bool {
        if username=="" || password=="" {
            return false
        } else {
            return true
        }
    }

    
}

struct S_input_ID: View {
    @Binding var id: String
    var body: some View {
        ZStack {
            Image("account")
                .resizable()
                .scaledToFit()
            TextField("Input your ID", text: $id)
                .font(.custom("AirbnbCereal_W_Md", size: 16))
                .offset(x: 70)
        }
    }
}

struct S_input_pwd: View {
    @Binding var pwd: String
    var body: some View {
        ZStack {
            Image("Password")
                .resizable()
                .scaledToFit()
            TextField("Input your password", text: $pwd)
                .font(.custom("AirbnbCereal_W_Md", size: 16))
                .offset(x: 70)
        }
    }
}

struct S_login_Previews: PreviewProvider {
    static var previews: some View {
        signUp()
    }
}
