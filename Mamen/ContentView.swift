//
//  ContentView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/5/22.
//

import AxisTabView
import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    @State private var constant = ATConstant(axisMode: .bottom, screen: .init(activeSafeArea: false), tab: .init())
        @State private var radius: CGFloat = 70
        @State private var concaveDepth: CGFloat = 0.85
        @State private var color: Color = .white
    
    
    let naviTitle = ["Home", "", "", ""]
    var body: some View {
        NavigationView{
            AxisTabView(selection: $selection, constant: ATConstant(axisMode: .bottom))
            { state in
                CustomCenterStyle(state, color: color, radius: radius, depth: concaveDepth)
            } content: {
                HomeView()
                    .navigationTitle("Home")
                    .tabItem(tag: 0, normal: {
                        Image("Home")
                    }, select: {
                        Image("Home_on")
                    })
                Course().navigationTitle("")
                    .tabItem(tag: 1, normal: {
                        Image("Course")
                    }, select: {
                        Image("Course_on")
                    })
                Home_Helper()
                    .navigationTitle("")
                    .tabItem(tag: 2, normal: {
                        Image("Ai")
                            .resizable()
                            .frame(width:90, height: 90)
                            .offset(y: -23)
                    }, select: {
                        Image("Ai")
                            .resizable()
                            .frame(width:90, height: 90)
                            .offset(y: -23)
                    })
                CalendarView().navigationTitle("")
                    .tabItem(tag: 3, normal: {
                        Image("Calendar")
                    }, select: {
                        Image("Calendar_on")
                    })
                Person().navigationTitle("")
                    .tabItem(tag: 4, normal: {
                        Image("Person")
                    }, select: {
                        Image("Person_on")
                    })
            } onTapReceive: { selectionTap in
                /// Imperative syntax
                print("---------------------")
                print("Selection : ", selectionTap)
                print("Already selected : ", self.selection == selectionTap)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
    extension View {
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif




struct CustomLineStyle: ATBackgroundStyle {
    
    var state: ATTabState
    var color: Color
    var lineColor: Color
    
    init(_ state: ATTabState = .init(), color: Color = .white, lineColor: Color = .accentColor) {
        self.state = state
        self.color = color
        self.lineColor = lineColor
    }
    
    var body: some View {
        let tabConstant = state.constant.tab
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(color)
                .shadow(color: tabConstant.shadow.color,
                        radius: tabConstant.shadow.radius,
                        x: tabConstant.shadow.x,
                        y: tabConstant.shadow.y)
            
            VStack(spacing: 0) {
                if state.constant.axisMode == .bottom {
                    Spacer()
                        .frame(height: tabConstant.normalSize.height)
                }
                Capsule()
                    .foregroundColor(lineColor)
                    .frame(width: tabConstant.selectWidth > 0 ? tabConstant.selectWidth : tabConstant.normalSize.width, height: 2)
                    .offset(x: state.getCurrentX(), y: state.constant.axisMode == .bottom ? -6 : state.safeAreaInsets.top + tabConstant.normalSize.height - 6)
                    .animation(state.constant.tab.animation ?? .none, value: state.currentIndex)
                
                if state.constant.axisMode == .top {
                    Spacer()
                        .frame(height: tabConstant.normalSize.height)
                }
            }
        }
    }
}


struct CustomCenterStyle: ATBackgroundStyle {
    
    var state: ATTabState
    var color: Color = .white
    var radius: CGFloat = 80
    var depth: CGFloat = 0.8
    
    init(_ state: ATTabState, color: Color, radius: CGFloat, depth: CGFloat) {
        self.state = state
        self.color = color
        self.radius = radius
        self.depth = depth
    }
    
    var body: some View {
        let tabConstant = state.constant.tab
        GeometryReader { proxy in
            ATCurveShape(radius: radius, depth: depth, position: 0.5)
                .fill(color)
                .frame(height: tabConstant.normalSize.height + (state.constant.axisMode == .bottom ? state.safeAreaInsets.bottom : state.safeAreaInsets.top))
                .scaleEffect(CGSize(width: 1, height: state.constant.axisMode == .bottom ? 1 : -1))
                .mask(
                    Rectangle()
                        .frame(height: proxy.size.height + 100)
                )
                .shadow(color: tabConstant.shadow.color,
                        radius: tabConstant.shadow.radius,
                        x: tabConstant.shadow.x,
                        y: tabConstant.shadow.y)
        }
        .animation(.easeInOut, value: state.currentIndex)
    }
}
