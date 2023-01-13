//
//  CustomDatePicker.swift
//  CustomDatePickerDemo
//
//  Created by Thongchai Subsaidee on 29/9/21.
//

import SwiftUI
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

class mana: ObservableObject {
    public var times: [Date] = [Date()]
}

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0

    var body: some View {
        VStack(spacing: 35) {
            // Days
            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

            HStack(spacing: 20) {
                Spacer()
                Button {
                    TapticEngine.impact.feedback(.medium)

                    currentMonth -= 1

                } label: {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[1])
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .onTapGesture {}
                }
                .padding(.horizontal, 30)

                Button {
                    TapticEngine.impact.feedback(.medium)

                    currentMonth += 1

                } label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .foregroundColor(Color(hex: "#4b5077"))
            .padding(.horizontal).offset(y: 10)

            // Day View...
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .frame(width:50)
                }
            }

            // Date
            // Lazy Grid..
            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("main-green"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 0.7 : 0)
                        )
                        .onTapGesture {
                            TapticEngine.impact.feedback(.medium)
                            currentDate = value.date
                        }
                }
            }
        }
        .onChange(of: currentMonth) { _ in
            // update month
            currentDate = getCurrentMonth()
        }
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                let dates = [Date()]
                if let task = dates.first(where: { time in
                    isSameDay(date1: time, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(isSameDay(date1: task, date2: currentDate) ? .white : Color(.gray))
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(isSameDay(date1: task, date2: currentDate) ? .white : Color("main-green"))
                        .frame(width: 8, height: 8)

                } else {
                    Text("\(value.day)")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : Color(.gray))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }

    // Checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    // Extraing year and month for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"

        let date = formatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current

        // Getting Current month date
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }

        return currentMonth
    }

    func extractDate() -> [DateValue] {
        let calendar = Calendar.current

        // Getting Current month date
        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            let dateValue = DateValue(day: day, date: date)
            return dateValue
        }

        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0 ..< firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current

        // geting start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)

        // getting date...
        return range!.compactMap { day -> Date in
            calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
