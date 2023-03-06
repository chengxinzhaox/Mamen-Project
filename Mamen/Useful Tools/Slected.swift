//
//  Slected.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import SwiftUI

struct Slected: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("My Courses", displayMode:.inline)
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

struct Slected_Previews: PreviewProvider {
    static var previews: some View {
        Slected()
    }
}
