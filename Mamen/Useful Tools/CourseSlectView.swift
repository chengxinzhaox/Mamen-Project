//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//

import SwiftUI

struct CourseSlectView: View {
    
    @Environment(\.dismiss) var dismiss
    var courseNames = ["C&C++", "IAP", "Web"]
    
    var body: some View {
        VStack {
            List{
                ForEach(courseNames, id: \.self){courseNames in
                    HStack{
                        
                        Text(courseNames)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Setting", displayMode: .inline)
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
        }
    }
    
}

struct CourseSlectView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSlectView()
    }
}
