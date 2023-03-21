//
//  DalleView.swift
//  OpenAI GPT-DALL-E
//
//  Created by kz on 06/02/2023.
//

import SwiftUI

struct DalleView: View {
    @Environment(\.dismiss) var dismiss
    @State var typingMessage: String = ""
    @ObservedObject var dalleViewModel = DalleViewModel()
    @Namespace var bottomID
    @FocusState private var fieldIsFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if !dalleViewModel.messages.isEmpty {
                ScrollViewReader { reader in
                    ScrollView(.vertical) {
                        ForEach(dalleViewModel.messages.indices, id: \.self) { index in
                            let message = dalleViewModel.messages[index]
                            MessageView(message: message)
                        }
                        Text("").id(bottomID)
                    }
                    .onAppear {
                        withAnimation {
                            reader.scrollTo(bottomID)
                        }
                    }
                    .onChange(of: dalleViewModel.messages.count) { _ in
                        withAnimation {
                            reader.scrollTo(bottomID)
                        }
                    }
                }
            } else {
                VStack{
                    Image("painter")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                    Spacer()
                        .frame(height: 30)
                    Text("Hi, geiv me some word then ")
                        .font(.custom("AirbnbCereal_W_Bd", size: 20))
                        .foregroundColor(Color("main-green"))
                        .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 5)
                    Text("I can draw for you!")
                        .foregroundColor(Color("main-green"))
                        .font(.custom("AirbnbCereal_W_Bd", size: 20))
                        .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
                
            HStack(alignment: .center) {
                TextField("Message...", text: $typingMessage, axis: .vertical)
                    .focused($fieldIsFocused)
                    .padding(.leading, 25)
                    .font(.custom("AirbnbCereal_W_Md", size: 16))
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .onTapGesture {
                        fieldIsFocused = true
                    }
                Button(action: sendMessage) {
                    Image(systemName: typingMessage.isEmpty ? "circle.circle" : "paintbrush.fill")
                        .resizable()
                        .fontWeight(.bold)
                        .scaledToFit()
                        .foregroundColor(typingMessage.isEmpty ? Color("main-green").opacity(0.75) : Color("main-green"))
                        .frame(width: 20, height: 20)
                        .padding()
                        .padding(.trailing, 10)
                }
            }
            .onDisappear {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.922))
            .cornerRadius(32)
            .padding([.leading, .trailing, .bottom], 10)
            
        }
        .background(.white)
        .gesture(TapGesture().onEnded {
            hideKeyboard()
        })
        .background(Color.white)
        .gesture(TapGesture().onEnded {
            hideKeyboard()
        })
        
        .navigationTitle("Painter")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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
    
    private func sendMessage() {
        guard !typingMessage.isEmpty else { return }
        Task {
            if !typingMessage.trimmingCharacters(in: .whitespaces).isEmpty {
                let tempMessage = typingMessage
                typingMessage = ""
                hideKeyboard()
                await dalleViewModel.generateImage(prompt: tempMessage)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct DalleView_Previews: PreviewProvider {
    static var previews: some View {
        DalleView()
    }
}
