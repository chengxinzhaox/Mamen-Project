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
    @AppStorage("userkey") var userkey=""

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
                    Image("Register")
                        .resizable()
                        .scaledToFit()
                        .offset(y: 80)
                        .padding([.leading, .trailing], 30)
                    Spacer()
                        .frame(height: 10)
                    S_input_ID(id: $username)
                        .offset(y: 100)
                    Spacer()
                        .frame(height: 26)
                    S_input_pwd(pwd: $password)
                        .offset(y: 100)
                    Spacer()
                        .frame(height: 100)

                    Button {
                        if !self.Check(username: self.username, password: self.password) {
                            TapticEngine.notification.feedback(.error)
                            self.isshow.toggle()
                        }
                        if !self.Save(username: username, password: password) {
                            self.isshow.toggle()
                        } else {
                            self.presentationMode.wrappedValue.dismiss()
                            ProgressHUD.showSucceed("Register successfully")
                        }

                    } label: {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 320, height: 50, alignment: .center)
                            .foregroundColor(Color(red: 0.575, green: 0.802, blue: 0.782))
                            .overlay {
                                Text("Sign Up")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
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

    private func Save(username: String, password: String)->Bool {
        if self.Check(username: username, password: password) {
            self.userkey=username + password
            return true
        }
        return false
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
                .font(.body)
                .fontWeight(.semibold)
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
                .font(.body)
                .fontWeight(.semibold)
                .offset(x: 70)
        }
    }
}

struct S_login_Previews: PreviewProvider {
    static var previews: some View {
        signUp()
    }
}
