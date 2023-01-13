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
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(y: -20)

                    Text("Chengdu University of technology")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .offset(y: -10)
                    Text("Software Engineeing")
                        .font(.system(size: 14))
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
                Image(systemName: "gearshape")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                RoundedRectangle(cornerRadius: 12, style:.continuous)
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
        Score()
    }
}

struct SubStructure: View {
    @State private var iscard = -80
    @AppStorage("money") var money = 0.0

    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20,style: .continuous )
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
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(self.iscard == -80 ? Color("main-green") : Color.gray)
                        Spacer()
                        Text("Score")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
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
    var body: some View {
        VStack {
            Text("🧑🏻‍💻")
                .font(.title)
            Text(" We are working on it")
                .font(.title2)
                .foregroundColor(Color("main-green"))
                .fontWeight(.bold)
                .offset(y: 15)
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
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.539, opacity: 0.542), radius: 5, x:1, y: 1)
                .padding(.all, 15)
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.white)
                    .frame(height: 78)
                    .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.765, opacity: 0.542), radius: 3, x: 1, y: 1)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Balance")
                            .font(.system(size: 15))
                            .foregroundColor(Color.black)
                            .fontWeight(.medium)
                        Text("CN¥\(String(money))")
                            .foregroundColor(Color.black)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 15)
                    .offset(x: -25)

                    Button {
                        self.isshow.toggle()
                        TapticEngine.impact.feedback(.medium)
                    } label: {
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .frame(width: 100, height: 37)
                            .foregroundColor(.black)
                            .overlay {
                                Text("Top Up")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }
                    .offset(x: 3)
                    .padding(.leading, 20)
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
                    .offset(x: 25)
                }
            }.padding(.horizontal, 25)

        }.offset(y: -60)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
