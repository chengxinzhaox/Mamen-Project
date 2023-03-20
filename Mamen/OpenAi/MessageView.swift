//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//


import SwiftUI

struct MessageView: View {
    var message: Message

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: message.isUserMessage ? .center : .top){
                    Image(message.isUserMessage ? "Profile" : "round")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 10)

                    switch message.type {
                    case .text:
                        let output = (message.content as! String).trimmingCharacters(in: .whitespacesAndNewlines)
                        Text(output)
                            .font(.custom("AirbnbCereal_W_Md", size: 16))
                            .foregroundColor(.black)
                            .textSelection(.enabled)
                    case .error:
                        let output = (message.content as! String).trimmingCharacters(in: .whitespacesAndNewlines)
                        Text(output)
                            .foregroundColor(.red)
                            .textSelection(.enabled)

                    case .image:
                        HStack(alignment: .center) {
                            Image(uiImage: message.content as! UIImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(13)
                                .shadow(color: .green, radius: 1)

                            Button(action: {
                                guard let image = message.content as? UIImage else {
                                    return
                                }

                                let avc = UIActivityViewController(activityItems: [image, UIImage()], applicationActivities: nil)

                                avc.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
                                    if completed && activityType == .saveToCameraRoll {
                                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                    }
                                }
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let window = windowScene.windows.first(where: { $0.isKeyWindow }),
                                   let rootViewController = window.rootViewController {
                                    rootViewController.present(avc, animated: true, completion: nil)
                                }
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                    case .indicator:
                        MessageIndicatorView()
                    }
                }
                .padding([.top, .bottom])
                .padding(.leading, 10)
            }
            Spacer()
        }
        .background(message.isUserMessage ? Color.white : Color.white)
        .shadow( radius: message.isUserMessage ? 0 : 0.5)

    }
}
