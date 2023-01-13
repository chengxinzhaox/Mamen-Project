//
//  LibaryView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/30/22.
//

import SwiftUI

struct LibaryView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("🧑🏻‍💻")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("main-green"))
                .padding()
            Text("Libary Page")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("main-green"))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct LibaryView_Previews: PreviewProvider {
    static var previews: some View {
        LibaryView()
    }
}


//Slide return back
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
