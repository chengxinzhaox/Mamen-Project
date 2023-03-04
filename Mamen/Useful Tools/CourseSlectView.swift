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
    var courseImags = ["C_imag", "HCI_imag", "Wad_imag", "Java_imag", "Database_imag", "Swift_imag", "CSS_imag", "GE_imag"]
    
    var types = ["Basic Course", "Software Engineering", "Software Engineering", "Basic Course", "Software Engineering", "Basic Course", "Software Engineering", "Pre-sessional Course"]
    
    var Teachers = ["Leon Liang", "Jons Slemmer", "Aymen Chebira", "Gore Jiang", "Maged Refat", "Tim Cook", "Bill Gates", "Sam Welsh"]
    
    var CourseSlected = [false, false, false, false, false, false, false, false,]
    
    var body: some View {
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Course List", displayMode:.automatic)
        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 13))
//                        .fontWeight(.bold)
//                        .foregroundColor(.gray)
//                }
//            }
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
