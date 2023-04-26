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
    
    
    @State private var iscard = -80
    @AppStorage("money") var money = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                Image("ID card")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height: 320)
                Spacer()
            }
            VStack {
                Spacer()
                    .frame(height: 105)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(hex: "FFFFFF"))
                    .frame(height: 330)
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
            .offset(x: 150, y: -330)
            
            VStack {
                Spacer()
                    .frame(height: 30)
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 95)
                    .padding(.top, 20)
                    .onTapGesture {
                        self.isshow.toggle()
                    }.alert(isPresented: $isshow) {
                        Alert(title: Text("Quit?"), primaryButton: .default(Text("Continue")) {
                            self.islogined = false
                            self.userkey = ""
                        }, secondaryButton: .cancel())
                    }
                Text("Byran Zhong")
                    .font(.custom("AirbnbCereal_W_Bd", size: 20))
                    .foregroundColor(.white)
                
                Text("Chengdu University of technology")
                    .font(.custom("AirbnbCereal_W_Md", size: 13))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                
                Text("Software Engineeing")
                    .font(.custom("AirbnbCereal_W_Md", size: 13))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(height: 40)
                
                // Bar
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
                .onTapGesture {
                    if self.iscard > 0 {
                        withAnimation {
                            self.iscard = -80
                        }
                        
                    } else {
                        withAnimation {
                            self.iscard = 80
                        }
                    }
                    TapticEngine.impact.feedback(.medium)
                }
                
                if self.iscard == -80 {
                    StudentCard(money: $money)
                } else {
                    Score()
                }
                Spacer()
            }
        }
    }
}

struct Person_preview: PreviewProvider {
    static var previews: some View {
        Person()
    }
}

struct Score: View {
    var courseNames = ["C&C++ Development", "Human Interface", "Web Application Development ", "JAVA Development", "Data Base", "Swift Development", "CSS & HTML", "Generic English"]
    
    var courseScores = [72, 90, 75, 73, 82, 88, 83, 83]
    
    func calculateGPA(score: Int) -> Double {
        switch score {
        case 90...100:
            return 4.0
        case 80...89:
            return 3.0
        case 70...79:
            return 2.0
        case 60...69:
            return 1.0
        default:
            return 0.0
        }
    }
        
    var averageScore: Double {
        let sum = courseScores.reduce(0, +)
        return Double(sum) / Double(courseScores.count)
    }
        
    var averageGPA: Double {
        let gpaSum = courseScores.map { calculateGPA(score: $0) }.reduce(0, +)
        return gpaSum / Double(courseScores.count)
    }
    
    var body: some View {
        VStack {
            List {
                HStack {
                    ZStack {
                        HStack {
                            Image("GPA")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17)
                            Text("GPA")
                                .font(.custom("AirbnbCereal_W_Bd", size: 15))
                                .foregroundColor(Color("main-green"))
                        }
                        .offset(x: -35, y: -59)
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                            .frame(width: 160, height: 160)
                        Group {
                            Circle()
                                .stroke(Color.gray, lineWidth: 10)
                                .opacity(0.1)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(averageGPA / 4.0))
                                .stroke(Color("main-green"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                .rotationEffect(.degrees(-90))

                            Text("\(averageGPA, specifier: "%.1f")")
                                .foregroundColor(Color("main-green"))
                                .font(.custom("AirbnbCereal_W_Bd", size: 19))
                        }
                        .offset(y: 15)
                        .frame(width: 90, height: 90)
                    }
    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            Image("Score")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17)
                            Text("Average")
                                .font(.custom("AirbnbCereal_W_Bd", size: 15))
                                .foregroundColor(Color("main-green"))
                        }
                        .offset(x: -22, y: -59)
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                            .frame(width: 160, height: 160)
                        Group {
                            Circle()
                                .stroke(Color.gray, lineWidth: 10)
                                .opacity(0.1)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(averageScore / 100.0))
                                .stroke(Color("main-green"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                            Text("\(averageScore, specifier: "%.1f")")
                                .foregroundColor(Color("main-green"))
                                .font(.custom("AirbnbCereal_W_Bd", size: 19))
                        }
                        .offset(y: 15)
                        .frame(width: 90, height: 90)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                ForEach(courseNames.indices, id: \.self) { index in
                    ScoreElement(scoreName: courseNames[index], scoreNumber: "\(courseScores[index])")
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .frame(height: 355)
        }
    }
}

struct StudentCard: View {
    @Binding var money: Double
    @State var isshow = false

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            Image("ID_card")
                .resizable()
                .frame(width: 340, height: 211.18)
                .scaledToFit()
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.539, opacity: 0.542), radius: 5, x: 1, y: 1)
            Spacer()
                .frame(height: 30)
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                    .frame(width: 336, height: 78)
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
                            .padding(.leading, 23)
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
        }
    }
}

struct ScoreElement: View {
    var scoreName: String
    var scoreNumber: String
    
    var body: some View {
        HStack {
            Text(scoreName)
                .foregroundColor(Color("main-green"))
                .font(.custom("AirbnbCereal_W_Md", size: 15))
            Spacer()
            Text(scoreNumber)
                .foregroundColor(.gray)
                .font(.custom("AirbnbCereal_W_Md", size: 15))
        }
        .padding(.horizontal)
    }
}
