//
//  AboutUs.swift
//  Mamen
//
//  Created by Chester Zhao on 5/16/23.
//

import SwiftUI

struct AboutUs: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("SettingLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                
            }
            Text("Mamen")
                .font(.custom("AirbnbCereal_W_Md", size: 28))
                .opacity(0.7)
            Spacer()
            Group {
                Text("Font End & UI design")
                    .font(.custom("AirbnbCereal_W_Bd", size: 18))
                    .opacity(0.7)
                Text("Chester")
                    .font(.custom("AirbnbCereal_W_Bd", size: 15))
                    .opacity(0.4)
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 250,height: 1)
                    .opacity(0.7)
                    .padding(.vertical, 10)
            }
            
            Group {
                Text("Back End")
                    .font(.custom("AirbnbCereal_W_Bd", size: 18))
                    .opacity(0.7)
                Text("Bryan Chloe Lily Bruce Shawn")
                    .font(.custom("AirbnbCereal_W_Bd", size: 15))
                    .opacity(0.4)
            }
        }
        .padding(.vertical, 90)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("About Us", displayMode: .inline)
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

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
