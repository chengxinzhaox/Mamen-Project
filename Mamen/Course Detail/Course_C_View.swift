//
//  Course_C_View.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct Course_C_View: View {
    @State var showDetailView = false
    @State var showWebView = false
    
    var body: some View {
        VStack {
            TeacherView(image: "leon", name: "Leon Liang", mail: "Leon@zy.edu.cn")
                .onTapGesture {
                    self.showDetailView = true
                    TapticEngine.impact.feedback(.medium)
                }
                .sheet(isPresented: $showDetailView){
                    LiangView()
                }
            VStack {
                HStack {
                    Text("Document List")
                        .font(.custom("AirbnbCereal_W_Bd", size:15))
                        .foregroundColor(Color("main-green"))
                        .padding(.leading, 30)
                        .padding(.top, 15)
                    Spacer()
                }
                ScrollView(showsIndicators: false){
                    VStack {
                        ZStack{
                            CourseFileView(image: "ZIP", name: "Example-week7.zip", time: "Dec 18 8:23PM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip")!)
                                    }
                            }
                        }
                        ZStack{
                            CourseFileView(image: "ZIP", name: "Example-week6.zip", time: "Dec 28 7:56PM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week6.zip")!)
                                    }
                            }
                        }
                        ZStack{
                            CourseFileView(image: "PDF", name: "chc5028-w4-oo.pdf", time: "Dec 22 8:23AM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/chc5028-week9-streams-and-overload-operator_0.pdf")!)
                                    }
                            }
                        }
                        ZStack{
                            CourseFileView(image: "PDF", name: "chc5028-w1-ccbsics.pdf", time: "Dec 21 7:23PM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://www.appcoda.com")!)
                                    }
                            }
                        }
                        ZStack{
                            CourseFileView(image: "ZIP", name: "week9-lecture.rar", time: "Nov 2 8:23PM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://www.appcoda.com")!)
                                    }
                            }
                        }
                        ZStack{
                            CourseFileView(image: "ZIP", name: "week10-lecture.rar", time: "Nov 21 7:43PM")
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title3)
                                    .padding(.trailing, 50)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView){
                                        SafariView(url: URL(string: "https://www.appcoda.com")!)
                                    }
                            }
                        }
                    }
                }
                .frame(height: 320)
            }
        }.offset(y: 135)
    }
}

struct Course_C_View_Previews: PreviewProvider {
    static var previews: some View {
        Course_C_View()
    }
}
