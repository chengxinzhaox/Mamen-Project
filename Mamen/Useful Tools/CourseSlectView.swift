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

//    @State var Course_classes = [
//
//
//        Course_class(name: "C&C++ Development", image: "C_imag", type: "Basic Course", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Leon Liang", teacher_image: "leon", teacher_emial: "leon@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "This course will help you master the high-level programming language, including key concepts such as pointers, memory management, classes, inheritance, and more. You will learn how to write efficient and effective C++ code for a variety of applications.", slected: false),
//
//        Course_class(name: "Human Interface", image: "HCI_imag", type: "Software Engineering", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Jons Slemmer", teacher_image: "jons", teacher_emial: "jons@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "The human interface course aims to teach you how to design and develop user-friendly software systems. You will learn how to create interfaces that are intuitive, aesthetically pleasing, and easy to navigate to improve user experience.", slected: false),
//
//        Course_class(name: "Web Application Development", image: "Wad_imag", type: "Software Engineering", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Aymen Chebira", teacher_image: "aymen", teacher_emial: "aymen@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "Web application design course will introduce students to key web design technologies and standards, including responsive design and cross-browser compatibility. You will learn how to create web applications that are scalable and adaptable using industry-standard tools and frameworks.", slected: false),
//
//        Course_class(name: "JAVA Development", image: "Java_imag", type: "Basic Course", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Gore Jiang", teacher_image: "gore", teacher_emial: "gore@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "The Java course will take students on a deep dive into this popular programming language, covering Java applications, systems, and security. You will learn how to write efficient and effective Java code for a wide range of applications.", slected: false),
//
//        Course_class(name: "Data Base", image: "Database_imag", type: "Software Engineering", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Maged Refat", teacher_image: "maged", teacher_emial: "maged@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "The database course will teach students key database concepts and design techniques, as well as methods for managing data using SQL. You will learn how to create and maintain efficient and effective databases to support a variety of applications.", slected: false),
//
//        Course_class(name: "Swift Development", image: "Swift_imag", type: "Software Engineering", location: "Apple Inc.,One Apple Park Way,Cupertino, CA 95014, United States", teacher_name: "Tim Cook", teacher_image: "tim", teacher_emial: "tim@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "Swift Development course will explore this popular programming language for iOS application development. Students will learn how to write efficient and effective Swift code for a variety of applications.", slected: false),
//
//        Course_class(name: "CSS & HTML", image: "CSS_imag", type: "Software Engineering", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Bill Gates", teacher_image: "bill", teacher_emial: "bill@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "The CSS and HTML course will teach you mastery of these two key web technologies, including scalable vector graphics, multimedia, and cross-browser support. You will learn how to create dynamic and responsive web designs using current industry standards and tools.", slected: false),
//
//        Course_class(name: "Generic English", image: "GE_imag", type: "Pre-sessional Course", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Sam Welsh", teacher_image: "sam", teacher_emial: "sam@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "This course aims to help non-native English speakers to improve their language skills, including reading, writing, and conversation. Students will study a variety of subjects and topics to expand their vocabulary, improve their grammar, and gain confidence in communicating in English.", slected: false),
//    ]
    
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
                    .onDelete(perform: { _ in
//                        Course_classes.remove(atOffsets: indexSet)
                    })
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
