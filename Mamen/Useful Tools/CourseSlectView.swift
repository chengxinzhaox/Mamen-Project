//
//  CourseSlectView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/3/23.
//

import SwiftUI

struct CourseSlectView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var Course_classes = [
        Course_class(name: "C&C++ Development", image: "C_imag", type: "Basic Course", teacher: "Leon Liang", slected: false),
        Course_class(name: "Human Interface", image: "HCI_imag", type: "Software Engineering", teacher: "Jons Slemmer", slected: false),
        Course_class(name: "Web Application Development", image: "Wad_imag", type: "Software Engineering", teacher: "Aymen Chebira", slected: false),
        Course_class(name: "JAVA Development", image: "Java_imag", type: "Basic Course", teacher: "Gore Jiang", slected: false),
        Course_class(name: "Data Base", image: "Database_imag", type: "Software Engineering", teacher: "Maged Refat", slected: false),
        Course_class(name: "Swift Development", image: "Swift_imag", type: "Software Engineering", teacher: "Tim Cook", slected: false),
        Course_class(name: "CSS & HTML", image: "CSS_imag", type: "Software Engineering", teacher: "Bill Gates", slected: false),
        Course_class(name: "Generic English", image: "GE_imag", type: "Pre-sessional Course", teacher: "Sam Welsh", slected: false),
    ]
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(Course_classes.indices, id: \.self) { index in
                        ZStack(alignment: .leading){
                            NavigationLink(destination: CourseDetailView(course: Course_classes[index])){
                                EmptyView()
                            }
                            .opacity(0)
                            
                            BasicRow(course: $Course_classes[index])
                        }
                            .swipeActions(edge: .leading, allowsFullSwipe: false,content: {
                                Button{

                                }label: {
                                    Image(systemName: "heart")
                                }
                                .tint(.green)

                                Button{

                                }label: {
                                    Image(systemName: "square.and.arrow.up")
                                }
                                .tint(.orange)
                            })
                    }
                    .onDelete(perform: { indexSet in
                        Course_classes.remove(atOffsets: indexSet)
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

                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Course List", displayMode:.inline)
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
    @Binding var course: Course_class
    
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
                Text(course.teacher)
                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                    .foregroundColor(.gray)
            }
            if course.slected {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .contextMenu {
            Button(action: {
               
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.course.slected.toggle()
            }) {
                HStack {
                    Text(course.slected ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
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

            let defaultText = "Just checking in at \(course.name)"

            if let imageToShare = UIImage(named: course.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
    }
}
