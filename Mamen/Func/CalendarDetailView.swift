//
//  CalendarDetailView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/17/23.
//

import SwiftUI

struct CalendarDetailView: View {
    
    var Element: Calendar_class
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text(Element.name)
                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                    .foregroundColor(Color("main-green"))
                Spacer()
            }
            Divider_Person()
            
            Spacer()
                .frame(height: 20)
            
            HStack{
                Image("Time")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                Text(Element.begin + " - " + Element.over)
                    .font(.custom("AirbnbCereal_W_Md", size: 15))
                Spacer()
            }
            Spacer()
                .frame(height: 15)
            HStack{
                Image("Map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                Text(Element.place)
                    .font(.custom("AirbnbCereal_W_Md", size: 15))
                Spacer()
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}

struct CalendarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetailView(Element: Calendar_class(date: 1, name: "C&C++", place: "8103", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")))
    }
}
