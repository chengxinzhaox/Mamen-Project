//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//


import SwiftUI

struct GPT3View: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var gpt3ViewModel = GPT3ViewModel()
    @State var typingMessage: String = ""
    @Namespace var bottomID
    @FocusState private var fieldIsFocused: Bool

    var body: some View {
        
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
                        Image("Talk_Pfo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                        Spacer()
                            .frame(height: 30)
                        Text("Hi, I'm Dr. Dinosaur and I can help")
                            .font(.custom("AirbnbCereal_W_Bd", size: 20))
                            .foregroundColor(Color("main-green"))
                            .padding(.horizontal, 20)
                        Spacer()
                            .frame(height: 2)
                        Text("you with your studies!")
                            .foregroundColor(Color("main-green"))
                            .font(.custom("AirbnbCereal_W_Bd", size: 20))
                            .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                HStack(alignment: .center){
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
                        Image(systemName: typingMessage.isEmpty ? "circle.circle" : "paperplane.fill")
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
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.922))
                .cornerRadius(32)
                .padding(.bottom, 10)
                .padding([.leading, .trailing], 25)
                
            }
            .background(Color.white)
            .gesture(TapGesture().onEnded {
                hideKeyboard()
            })
            
            .navigationTitle("Course Consultant")
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
