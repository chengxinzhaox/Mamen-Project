//
//  SlectedDetailView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course:Course_class
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image(course.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarTitle("Course List", displayMode:.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: Course_class(name: "C&C++ Development", image: "C_imag", type: "Basic Course", teacher: "Leon Liang", slected: false))
    }
}
