//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//

import SwiftUI

struct CourseSlectView: View {
    @Environment(\.dismiss) var dismiss
        
    var courseNames = ["C&C++ Development", "Human Interface", "Web Application Development ", "JAVA Development", "Data Base", "Swift Development", "CSS & HTML", "Generic English"]
    
    @State var courseScores = [72, 90, 45, 23, 82, 88, 63, 43]
    
    @State var courseImags = ["C_imag", "HCI_imag", "Wad_imag", "Java_imag", "Database_imag", "Swift_imag", "CSS_imag", "GE_imag"]
    
    @State var types = ["Basic Course", "Software Engineering", "Software Engineering", "Basic Course", "Software Engineering", "Basic Course", "Software Engineering", "Pre-sessional Course"]
    
    @State var Teachers = ["Leon Liang", "Jons Slemmer", "Aymen Chebira", "Gore Jiang", "Maged Refat", "Tim Cook", "Bill Gates", "Sam Welsh"]
    
    @State var CourseSlected = [false, false, false, false, false, false, false, false]
    
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(courseNames.indices, id: \.self) { index in
                        HStack(alignment: .top) {
                            Image(courseImags[index])
                                .resizable()
                                .frame(width: 120, height: 118)
                                .cornerRadius(20)
                                .padding(.trailing, 10)
                            VStack(alignment: .leading) {
                                Text(courseNames[index])
                                    .font(.custom("AirbnbCereal_W_Md", size: 18))
                                Text(types[index])
                                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                                    .foregroundColor(.gray)
                                Text(Teachers[index])
                                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                
                .listStyle(.plain)
            }
            VStack {
                Spacer()
                NavigationLink {
                    Slected()
                } label: {
                    RoundedRectangle(cornerRadius: 90, style: .continuous)
                        .foregroundColor(Color("main-green"))
                        .frame(width: 100, height: 45)
                        .overlay {
                            HStack {
                                Image("List")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("List")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                }

                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Course List", displayMode:.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct CourseSlectView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSlectView()
    }
}
