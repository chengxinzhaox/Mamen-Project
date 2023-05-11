//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//

import SwiftUI
import SwiftyJSON

struct CourseSlectView: View {
    @State private var coursejson: responseBody = .init(result: 0, message: "", data: nil)
    @Environment(\.dismiss) var dismiss
    @AppStorage("selectedCourse") var selectedCourse: [String] = []
    var body: some View {
        let json = JSON(coursejson.data ?? "")
        ZStack {
            VStack {
                List {
                    ForEach(0 ..< json.count, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            NavigationLink(destination: CourseDetailView(course: Course_class(name: json[index, "title"].stringValue, image: json[index, "pic"].stringValue, type: json[index, "type"].stringValue, location: json[index, "room"].stringValue, teacher_name: json[index, "fullname"].stringValue, teacher_image: json[index, "name"].stringValue, teacher_emial: json[index, "email"].stringValue, teacher_workTime: json[index, "worktime"].stringValue, teacher_office: json[index, "workroom"].stringValue, teacher_office_location: json[index, "workroomdetail"].stringValue, descrip: json[index, "info"].stringValue, slected: false))) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            BasicRow(course: Course_class(name: json[index, "title"].stringValue, image: json[index, "pic"].stringValue, type: json[index, "type"].stringValue, location: json[index, "room"].stringValue, teacher_name: json[index, "fullname"].stringValue, teacher_image: json[index, "name"].stringValue, teacher_emial: json[index, "email"].stringValue, teacher_workTime: json[index, "worktime"].stringValue, teacher_office: json[index, "workroom"].stringValue, teacher_office_location: json[index, "workroomdetail"].stringValue, descrip: json[index, "info"].stringValue, slected: false))
                        }
                    }
                   
                    .listRowSeparator(.hidden)
                }
                
                .listStyle(.plain)
            }
            VStack {
                Spacer()
                NavigationLink {
                    Slected()
                } label: {
                    RoundedRectangle(cornerRadius: 90, style: .continuous)
                        .foregroundColor(Color("main-green"))
                        .frame(width: 100, height: 45)
                        .overlay {
                            HStack {
                                Image("List")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text("List")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                }

            }.task {
                r.GetAllCourses { result in
                    self.coursejson = result
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Course List", displayMode: .inline)
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "plus")
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

struct BasicRow: View {
    @State private var shouwOptions = false
    @State var course: Course_class
    
    var body: some View {
        HStack(alignment: .top) {
            Image(course.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(20)
                
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(course.name)
                    .font(.custom("AirbnbCereal_W_Md", size: 18))
                Text(course.type)
                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                    .foregroundColor(.gray)
                Text(course.teacher_name)
                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                    .foregroundColor(.gray)
            }
            if course.slected {
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.yellow)
            }
        }
        .contextMenu {
//            Button(action: {
//
//            }) {
//                HStack {
//                    Text("Reserve a table")
//                    Image(systemName: "phone")
//                }
//            }
            
            Button(action: {
                self.course.slected.toggle()
            }) {
                HStack {
                    Text(course.slected ? "Remove from list" : "Mark as slected")
                    Image(systemName: "checkmark.circle")
                }
            }
            
            Button(action: {
                self.shouwOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $shouwOptions) {
            let defaultText = "Just checking the \(course.name)"

            if let imageToShare = UIImage(named: course.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
    }
}
