//
//  DeadlineView.swift
//  Mamen Watch Watch App
//
//  Created by Chester Zhao on 3/28/23.
//

import SwiftUI

struct DeadlineView: View {
    var body: some View {
        
            DeadlineElementView(deadlineDate: Date().addingTimeInterval(9 * 24 * 60 * 60), deadlineTitle: "HCI")
        
    }
}

struct DeadlineElementView: View {
    let deadlineDate: Date // Deadline时间
    let deadlineTitle: String // Deadline标题
    @State private var daysRemaining: Int = 0 // 剩余天数

    // 计算并更新剩余天数
    private func updateDaysRemaining() {
        let currentDate = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day], from: currentDate, to: deadlineDate)
        daysRemaining = max(dateComponents.day ?? 0, 0)
    }

    // 根据剩余天数返回对应的渐变色
    private func gradientColors() -> [Color] {
        switch daysRemaining {
        case ..<5:
            return [Color.red]
        case 5 ... 10:
            return [Color.yellow]
        default:
            return [Color.green]
        }
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 15)
                    .rotationEffect(Angle(degrees: -90.0))
                    .animation(.easeInOut(duration: 0.5))
                    .padding()
                Circle()
                    .trim(from: 1.0 - CGFloat(Double(daysRemaining) / 20.0), to: 1.0)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: gradientColors()),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 15.0, lineCap: .round)
                    )
                    .rotationEffect(Angle(degrees: -90.0))
                    .animation(.easeInOut(duration: 0.5))
                    .padding()
                VStack {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                        .frame(height: 5)
                    Text(deadlineTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("\(daysRemaining) Day")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .offset(y:5)
            }
            .frame(width: 160)
        }
        .onAppear {
            // 初始化时计算剩余天数
            updateDaysRemaining()

            // 每分钟更新剩余天数
            let _ = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { _ in
                updateDaysRemaining()
            }
        }
    }
}

struct DeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        DeadlineView()
    }
}
