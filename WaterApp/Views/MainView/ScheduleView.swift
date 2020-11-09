//
//  ScheduleView.swift
//  WaterApp
//
//  Created by Aiur on 07.11.2020.
//

import SwiftUI

struct ScheduleItem: Hashable {
    var state: TriangleState = .notYet
    private var time: Date
    
    var hourMinute: String {
        get {
//            let calendar = Calendar.current
//            let hours = calendar.component(.hour, from: time)
//            let minutes = calendar.component(.minute, from: time)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: time)
//            return "\(hours):\(minutes)"
        }
    }
    
    init(state: TriangleState = .notYet, time: Date) {
        self.state = state
        self.time = time
    }
}

struct ScheduleView: View {
    
    private func randomMinute() -> Int {
        var minutes: [Int] = []
        for i in stride(from: 0, to: 60, by: 5) {
            minutes.append(i)
        }
        return minutes.randomElement() ?? 0
    }
    
    private func generateDateComponent() -> DateComponents {
        var dateComponent = DateComponents()
        dateComponent.hour = Int.random(in: 0...24)
        dateComponent.minute = randomMinute()
        return dateComponent
    }
    
    private func genDate() -> Date {
        return Calendar.current.date(from: generateDateComponent()) ?? Date()
    }
    
    var arrayOfSchedule: Array<ScheduleItem> = []
    
    init() {
        self.arrayOfSchedule.append(ScheduleItem(state: .success, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(state: .success, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(state: .fail, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(state: .fail, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(state: .success, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(state: .success, time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(time: genDate()))
        self.arrayOfSchedule.append(ScheduleItem(time: genDate()))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
//                    .border(Color.black, width: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Your daily schedule")
                    .black()
                    .padding([.leading, .trailing])
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 0.5)
                        .frame(height: 1)
                        .foregroundColor(.black)
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            ForEach(arrayOfSchedule, id: \.self) { (item: ScheduleItem) in
                                VStack {
                                    TriangleView(size: 20, status: item.state)
                                    Text(item.hourMinute).black()
                                }.frame(width: 50)
                            }
                        }.padding([.leading, .trailing])
//                            .frame(height: 80)
//                            .offset(y: 15)
                    }
                }
            }
        }
        .frame(height: 110)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView().padding()
    }
}
