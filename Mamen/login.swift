//
//  login.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

struct login: View {
    
    @State private var username=""
    @State private var password=""
    @AppStorage("userkey") var userkey=""
    @State private var isshow=false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("islogined") var islogined=false
    
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
                    Spacer().frame(height: 100)
                    Image("Welcome_Back").resizable().scaledToFit().offset(y: 30).padding([.leading, .trailing], 40)
                    input_ID(id: $username).offset(y: 50)
                    Spacer().frame(height: 26)
                    input_pwd(pwd: $password).offset(y: 40)
                    Spacer().frame(height: 85)

                    Button {
                        let newuserkey=username + password
                        if newuserkey.count > 0 && newuserkey == userkey {
                            self.islogined.toggle()
                            ProgressHUD.showSucceed("Success")
                        } else {
                            self.isshow.toggle()
                        }
                    } label: {
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
                    .offset(y: 50)
                }
                .padding(30)
                .offset(y: 50)
                .alert(isPresented: $isshow) {
                    Alert(title: Text("Login Faild"), message: Text("Check you ID or password"), dismissButton: .default(Text("Done")))
                }
                VStack {
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("Back_Arrow").resizable().scaledToFit().frame(width: 37)
                        }
                        Spacer()
                    }
                    Spacer()
                }.padding(30).padding(.top, 30)
            }
        }
    }
}

struct input_ID: View {
    
    @Binding var id: String
    
    var body: some View {
        ZStack {
            Image("account").resizable().scaledToFit()
            TextField("Input your ID", text: $id).font(.body).fontWeight(.semibold).offset(x: 70)
        }
    }
}

struct input_pwd: View {
    
    @Binding var pwd: String
    
    var body: some View {
        ZStack {
            Image("Password").resizable().scaledToFit()
            TextField("Input your password", text: $pwd)
                .font(.body)
                .fontWeight(.semibold)
                .offset(x: 70)
        }
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
