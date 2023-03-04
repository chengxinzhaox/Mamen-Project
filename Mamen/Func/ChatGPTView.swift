////
////  ChatGPTView.swift
////  Mamen
////
////  Created by Chester Zhao on 3/3/23.
////
//
//
//
//import SwiftUI
//
//struct ChatGPTView: View {
//    @State private var prompt = ""
//    @State private var response = ""
//
//    var body: some View {
//        VStack {
//            TextField("Enter prompt", text: $prompt)
//                .padding()
//
//            Button("Send Request") {
//                // 构造API请求
//                let headers = [
//                    "Content-Type": "application/json",
//                    "Authorization": "Bearer YOUR_ACCESS_TOKEN"
//                ]
//                let parameters = [
//                    "prompt": prompt,
//                    "temperature": 0.7,
//                    "max_tokens": 60
//                ]
//                let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
//
//                var request = URLRequest(url: URL(string: "https://api.openai.com/v1/engines/davinci-codex/completions")!)
//                request.httpMethod = "POST"
//                request.allHTTPHeaderFields = headers
//                request.httpBody = postData
//
//                // 发送API请求
//                let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                    if let error = error {
//                        print("Error: \(error)")
//                    } else if let data = data {
//                        // 解析API响应
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                        do {
//                            let response = try decoder.decode(Response.self, from: data)
//                            DispatchQueue.main.async {
//                                self.response = response.choices[0].text
//                            }
//                        } catch let error {
//                            print("Error: \(error)")
//                        }
//                    }
//                }
//                task.resume()
//            }
//            .padding()
//
//            Text(response)
//                .padding()
//        }
//    }
//}
//
//struct Response: Codable {
//    let choices: [Choice]
//}
//
//struct Choice: Codable {
//    let text: String
//}
//
//
//struct ChatGPTView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatGPTView()
//    }
//}
