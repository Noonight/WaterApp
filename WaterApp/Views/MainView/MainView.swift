//
//  ContentView.swift
//  WaterApp
//
//  Created by Aiur on 29.10.2020.
//

import SwiftUI
import CoreData

struct MainView: View {
    @State private var progress = 0.6
    @State private var waveLength = 5.0 // for action with add water
    
    @State private var alertTime: Date? = Date()
    
    @State private var modalStatisticsBtn: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            WaveView(progress: progress, strength: waveLength)
                .overlay(
                    HStack {
                        StatisticButton(tap: {
                            modalStatisticsBtn.toggle()
                        })
                        .sheet(isPresented: $modalStatisticsBtn, content: {
                            MonthlyReportView()
                        })
                        Spacer()
                        SettingsButton()
                    }
                    .padding()
                    , alignment: .top)
                .overlay(
                    HStack {
                        DailyCupsView()
                        Spacer()
                        DailyGoalView()
                    }
                    .frame(height: 100)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 16)
                    , alignment: .bottom)
                .overlay(StateWaveView())
            
            ScheduleView()
                .frame(height: 110)
                .offset(x: 0, y: -25)
                .padding(.bottom, -25)
                .padding([.leading, .trailing])
            
            if let alertTime = alertTime {
                AlertView(time: alertTime)
                    .padding([.leading, .trailing])
                    .offset(y: -1)
            }
            
            ButtonsView()
                .padding([.top, .bottom])
            
        }//.edgesIgnoringSafeArea(.top)
            .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
