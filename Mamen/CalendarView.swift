//
//  CalendarView.swift
//  Mamen
//
//  Created by Chester Zhao on 1/4/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var current = Date()
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .foregroundColor(Color("main-green"))
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .frame(height: 210)
            }
            VStack {
                // Title
                HStack {
                    Text("Calendar")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                    Spacer()
                }
                .padding(.bottom, 10)

                // Calendar
                HStack {
                    //CustomDatePicker(currentDate: $current)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
