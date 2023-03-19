//
//  NewCourseView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/18/23.
//

import SwiftUI

struct NewCourseView: View {
    
    
    
    var body: some View {
        VStack{
            FromTextField(lable: "Name", placeholder: "Course Name", value: "")
            FromTextView(lable: "Des", value: "")
        }
        
        
    }
}

struct NewCourseView_Previews: PreviewProvider {
    static var previews: some View {
        NewCourseView()
    }
}

struct FromTextField: View {
    
    let lable: String
    var placeholder: String
    
    @State var value: String
    
    var body: some View {
        VStack{
            HStack {
                Text(lable)
                    .font(.custom("AirbnbCereal_W_Bd", size: 17))
                Spacer()
            }
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke()
                .frame(width: 350, height: 50)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                .overlay {
                    TextField(placeholder, text: $value)
                        .font(.custom("AirbnbCereal_W_Md", size: 15))
                        .padding(.horizontal, 20)
                }
            
        }
        .padding(.horizontal, 30)
    }
}

struct FromTextView: View {
    
    let lable: String
    var height: CGFloat = 180.00
    
    @State var value: String
    
    var body: some View {
        VStack{
            HStack {
                Text(lable)
                    .font(.custom("AirbnbCereal_W_Bd", size: 17))
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke()
                .frame(width: 350, height: 200)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.917))
                .overlay {
                    TextEditor(text: $value)
                        .font(.custom("AirbnbCereal_W_Md", size: 15))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .frame(height: height)
                        .padding(.horizontal, 20)
                }
            
        }
        .padding(.horizontal, 30)
    }
}
