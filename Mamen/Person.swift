//
//  SwiftUIView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import SwiftUI

struct Person: View {
    
    @State private var isshow = false
    @State private var showSettingView = false
    @AppStorage("islogined") var islogined = false
    @AppStorage("userkey") var userkey = ""
    
    

    var body: some View {
        ZStack {
            Image("ID card")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Group {
                    Spacer()

                    Image("Profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(y: -20)
                        .onTapGesture {
                            self.isshow.toggle()
                        }.alert(isPresented: $isshow) {
                            Alert(title: Text("Quit?"), primaryButton: .default(Text("Continue")) {
                                self.islogined = false
                                self.userkey = ""
                            }, secondaryButton: .cancel())
                        }
                    Text("Lily Yuan")
                        .font(.custom("AirbnbCereal_W_Bd", size: 20))
                        .foregroundColor(.white)
                        .offset(y: -20)

                    Text("Chengdu University of technology")
                        .font(.custom("AirbnbCereal_W_Md", size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .offset(y: -10)
                    Text("Software Engineeing")
                        .font(.custom("AirbnbCereal_W_Md", size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .offset(y: -10)
                    Spacer()
                        .frame(height: 45)
                }
                .offset(y: 30)
                SubStructure()
            }
            ZStack {
                Image("Setting")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(Color(hex: "E8E8E8"), lineWidth: 2)
                    .frame(width: 40, height: 40)
            }
            .onTapGesture {
                self.showSettingView = true
                TapticEngine.impact.feedback(.medium)
            }
            .sheet(isPresented: $showSettingView) {
                SettingView()
            }
            .offset(x: 140, y: -360)
        }
    }
}

struct Person_preview: PreviewProvider {
    static var previews: some View {
        Person()
    }
}

struct SubStructure: View {
    @State private var iscard = -80
    @AppStorage("money") var money = 0.0

    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(hex: "FFFFFF"))
                .frame(height: 580)
                .shadow(radius: 4.0)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .frame(width: 340, height: 50)
                        .foregroundColor(Color(hex: "F7F7F7"))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .frame(width: 180, height: 50)
                            .foregroundColor(Color(hex: "FFFFFF"))

                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color(hex: "E8E8E8"), lineWidth: 2)
                            .frame(width: 180, height: 50)
                    }
                    .offset(x: CGFloat(iscard))
                    .animation(.easeInOut, value: iscard)
                    HStack {
                        Text("Card")
                            .font(.custom("AirbnbCereal_W_Bd", size: 15))
                            .foregroundColor(self.iscard == -80 ? Color("main-green") : Color.gray)
                        Spacer()
                        Text("Score")
                            .font(.custom("AirbnbCereal_W_Bd", size: 15))
                            .foregroundColor(self.iscard == 80 ? Color("main-green") : Color.gray)
                    }
                    .padding(.horizontal, 90)
                }
                .offset(y: -60)
                .onTapGesture {
                    if self.iscard > 0 {
                        self.iscard = -80
                    } else {
                        self.iscard = 80
                    }
                    TapticEngine.impact.feedback(.medium)
                }

                if self.iscard == -80 {
                    StudentCard(money: $money)
                        .animation(.default, value: iscard)
                } else {
                    Score()
                        .animation(.default, value: iscard)
                }

            }.offset(y: 70)
        }
    }
}


struct Score: View {
    
    
    var courseNames = ["C&C++ Development", "Human Interface", "Web Application Development ", "JAVA Development", "Data Base", "Swift Development", "CSS & HTML", "Generic English"]
    
    var courseScores = ["72", "90", "45", "23", "82", "88", "63", "43"]
    
    var body: some View {
        VStack {
            List {
                ForEach(courseNames.indices, id: \.self){ index in
                    ScoreElement(scoreName: courseNames[index], scoreNumber: courseScores[index])
                }
                
            }
            .listStyle(.plain)
            .frame(height: 380)
        }
    }
}

struct StudentCard: View {
    @Binding var money: Double
    @State var isshow = false

    var body: some View {
        Group {
            Image("ID_card")
                .resizable()
                .frame(width: 340, height: 211.18)
                .scaledToFit()
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.539, opacity: 0.542), radius: 5, x: 1, y: 1)
                .padding(.all, 15)
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                    .frame(height: 78)
                HStack {
                    ZStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Balance")
                                    .font(.custom("AirbnbCereal_W_Md", size: 15))
                                    .foregroundColor(Color.black)
                                Text("CN¥\(String(money))")
                                    .foregroundColor(Color.black)
                                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                            }
                            .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Group {
                                Button {
                                    self.isshow.toggle()
                                    TapticEngine.impact.feedback(.medium)
                                } label: {
                                    RoundedRectangle(cornerRadius: 90, style: .continuous)
                                        .frame(width: 100, height: 37)
                                        .foregroundColor(.black)
                                        .overlay {
                                            Text("Top Up")
                                                .font(.custom("AirbnbCereal_W_Bd", size: 15))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                }
                                .actionSheet(isPresented: $isshow) {
                                    ActionSheet(title: Text("Please select"), buttons: [.default(Text("20RMB")) {
                                        ProgressHUD.show()
                                        Task {
                                            // 休眠0.5秒
                                            try await Task
                                                .sleep(nanoseconds: 500000000)
                                            ProgressHUD.showSucceed("Success")
                                            self.money += 20.0
                                            TapticEngine.impact.feedback(.medium)
                                        }

                                    }, .default(Text("50RMB")) {
                                        ProgressHUD.show()
                                        Task {
                                            try await Task
                                                .sleep(nanoseconds: 500000000)
                                            ProgressHUD.showSucceed("Success")
                                            self.money += 50.0
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                    }, .default(Text("100RMb")) {
                                        ProgressHUD.show()
                                        Task {
                                            try await Task
                                                .sleep(nanoseconds: 500000000)
                                            ProgressHUD.showSucceed("Success")
                                            self.money += 100.0
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                    }, .cancel()])
                                }
                            }
                            .padding(.trailing)
                        }
                    }
                }
            }.padding(.horizontal, 25)

        }.offset(y: -60)
    }
}

struct ScoreElement: View {
    
    var scoreName: String
    var scoreNumber: String
    
    var body: some View {
        HStack{
            Text(scoreName)
                .foregroundColor(Color("main-green"))
                .font(.custom("AirbnbCereal_W_Md", size: 15))
            Spacer()
            Text(scoreNumber)
                .font(.custom("AirbnbCereal_W_Md", size: 15))
        }
        .padding(.horizontal)
    }
}
