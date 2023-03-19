//
//  ChatBotView.swift
//  OpenAI GPT-DALL-E
//
//  Created by kz on 25/01/2023.
//

import SwiftUI

struct GPT3View: View {
    
    @ObservedObject var gpt3ViewModel = GPT3ViewModel()
    @State var typingMessage: String = ""
    @Namespace var bottomID
    @FocusState private var fieldIsFocused: Bool

    var body: some View {
        NavigationView(){
            VStack(alignment: .leading){
                if !gpt3ViewModel.messages.isEmpty{
                    ScrollViewReader { reader in
                        ScrollView(.vertical) {
                            ForEach(gpt3ViewModel.messages) { message in
                                MessageView(message: message)
                            }
                            Text("").id(bottomID)
                        }
                        
                        .onChange(of: gpt3ViewModel.messages.last?.content as? String) { _ in
                            DispatchQueue.main.async {
                                withAnimation {
                                    reader.scrollTo(bottomID)
                                }
                            }
                        }
                        .onChange(of: gpt3ViewModel.messages.count) { _ in
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                        
                        .onAppear {
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                    }
                } else {
                    VStack{
                        Image(systemName: "ellipses.bubble")
                            .font(.largeTitle)
                        Text("Talk with your course selection consultant")
                            .font(.subheadline)
                            .padding(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                HStack(alignment: .center){
                    TextField("Message...", text: $typingMessage, axis: .vertical)
                        .focused($fieldIsFocused)
                        .padding()
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onTapGesture {
                            fieldIsFocused = true
                        }
                    Button(action: sendMessage) {
                        Image(systemName: typingMessage.isEmpty ? "circle" : "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(typingMessage.isEmpty ? .black.opacity(0.75) : .black)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
                .onDisappear {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.922))
                .cornerRadius(32)
                .padding([.leading, .trailing, .bottom], 10)
                
            }
            .background(.white)
            .gesture(TapGesture().onEnded {
                hideKeyboard()
            })
            
            .navigationTitle("Course Selection Consultant")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func sendMessage() {
        guard !typingMessage.isEmpty else { return }
        let tempMessage = typingMessage
        typingMessage = ""
        hideKeyboard()
        Task{
            await gpt3ViewModel.getResponse(text: tempMessage)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}

struct GPT3View_Previews: PreviewProvider {
    static var previews: some View {
        GPT3View()
    }
}
