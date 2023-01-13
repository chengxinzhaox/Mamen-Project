//
//  SafariView.swift
//  helloWorld
//
//  Created by Chester Zhao on 12/23/22.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

    var url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
}
//struct SafariView_Previews: PreviewProvider {
//    static var previews: some View {
//        SafariView()
//    }
//}
