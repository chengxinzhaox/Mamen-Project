//
//  Home_Helper.swift
//  Mamen
//
//  Created by Chester Zhao on 3/20/23.
//

import SwiftUI

struct Home_Helper: View {
    @State private var message = "Hello, World!"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer()
                    .frame(height: 40)
                Text("Mamen Assistant")
                    .font(.custom("AirbnbCereal_W_xBd", size: 32))
                    .foregroundColor(Color("main-green"))
                    .padding(.bottom, 50)
                
                Group {
                    HStack {
                        Image(systemName: "person.fill.questionmark")
                            .font(.custom("AirbnbCereal_W_Bd", size: 26))
                            .foregroundColor(Color("main-green"))
                            .padding(.trailing, 10)
                        Text("Consultant")
                            .font(.custom("AirbnbCereal_W_Bd", size: 18))
                            .foregroundColor(Color("main-green"))
                    }
                    .opacity(0.8)
                    .padding(.bottom, 15)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "I am a computer science student and I need some advice on my courses."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                Text("\"I am a computer science student and I need some advice on my courses.\"")
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("AirbnbCereal_W_Md", size: 16))
                                    .padding(.horizontal, 17)
                            }
                    }
                    .padding(.bottom, 5)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "Give me some information about HCI class."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                VStack {
                                    Text("\"Give me some information about HCI class.\"")
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.center)
                                        .font(.custom("AirbnbCereal_W_Md", size: 16))
                                        .padding(.horizontal, 17)
                                }
                            }
                    }
                    .padding(.bottom, 15)
                    
                    NavigationLink(destination: GPT3View()) {
                        HStack {
                            Text("Use Consultant")
                                .font(.custom("AirbnbCereal_W_Md", size: 15))
                                .foregroundColor(Color("main-green"))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color("main-green"))
                        }
                        .opacity(0.8)
                    }
                }
                
                Divider_Person()
                    .padding(.vertical, 30)
                
                Group {
                    HStack {
                        Image(systemName: "text.magnifyingglass")
                            .font(.custom("AirbnbCereal_W_Bd", size: 26))
                            .foregroundColor(Color("main-green"))
                            .padding(.trailing, 10)
                        Text("Translator")
                            .font(.custom("AirbnbCereal_W_Bd", size: 18))
                            .foregroundColor(Color("main-green"))
                    }
                    .opacity(0.8)
                    .padding(.bottom, 15)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "Lack of clear, well-thought-out Goals and Specifications."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                Text("\"Lack of clear, well-thought-out Goals and Specifications.\"")
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("AirbnbCereal_W_Md", size: 16))
                                    .padding(.horizontal, 17)
                            }
                    }
                    .padding(.bottom, 5)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "Gunther Verheyen. Managing Risk & Quality with Scrum."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                VStack {
                                    Text("\"Gunther Verheyen. Managing Risk & Quality with Scrum.\"")
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.center)
                                        .font(.custom("AirbnbCereal_W_Md", size: 16))
                                        .padding(.horizontal, 17)
                                }
                            }
                    }
                    .padding(.bottom, 15)

                    NavigationLink(destination: Translator_View()) {
                        HStack {
                            Text("Use Translator")
                                .font(.custom("AirbnbCereal_W_Md", size: 15))
                                .foregroundColor(Color("main-green"))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color("main-green"))
                        }
                        .opacity(0.8)
                    }
                }
                
                Divider_Person()
                    .padding(.vertical, 30)
                
                Group {
                    HStack {
                        Image(systemName: "paintpalette.fill")
                            .font(.custom("AirbnbCereal_W_Bd", size: 26))
                            .foregroundColor(Color("main-green"))
                            .padding(.trailing, 10)
                        Text("Painer")
                            .font(.custom("AirbnbCereal_W_Bd", size: 18))
                            .foregroundColor(Color("main-green"))
                    }
                    .opacity(0.8)
                    .padding(.bottom, 15)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "ghost in harsh shadow, torn clothing, bow tie, broken teeth,no ears."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                Text("\"ghost in harsh shadow, torn clothing, bow tie, broken teeth,no ears.\"")
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("AirbnbCereal_W_Md", size: 16))
                                    .padding(.horizontal, 17)
                            }
                    }
                    .padding(.bottom, 5)
                    
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "a low polygon whale with upwards scaling graph in the background."
                        print("Message copied to clipboard: hello world")
                    }) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.006, brightness: 0.965))
                            .overlay {
                                VStack {
                                    Text("\"a low polygon whale with upwards scaling graph in the background.\"")
                                        .foregroundColor(Color.gray)
                                        .multilineTextAlignment(.center)
                                        .font(.custom("AirbnbCereal_W_Md", size: 16))
                                        .padding(.horizontal, 17)
                                }
                            }
                    }
                    .padding(.bottom, 15)
                    
                    NavigationLink(destination: DalleView()) {
                        HStack {
                            Text("Start painting")
                                .font(.custom("AirbnbCereal_W_Md", size: 15))
                                .foregroundColor(Color("main-green"))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color("main-green"))
                        }
                        .opacity(0.8)
                    }
                }
                Spacer()
                    .frame(height: 60)
            }
        }
    }
}

struct Home_Helper_Previews: PreviewProvider {
    static var previews: some View {
        Home_Helper()
    }
}
