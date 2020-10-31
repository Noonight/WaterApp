//
//  WaveView2.swift
//  WaterApp
//
//  Created by Aiur on 30.10.2020.
//

import SwiftUI

struct Wave2: Shape {
    let progress: CGFloat
    var applitude: CGFloat = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 5, by: 5) {
            let relativeX = x / waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * applitude * normalizedLength
//            let y = progressHeight + sin(phase + relativeX) * applitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
//        path.addLine(to: CGPoint(x: width, y: progressHeight))
//        path.addLine(to: CGPoint(x: width, y: height))
//        path.addLine(to: CGPoint(x: 0, y: height))
//        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
    }
}

struct WaveView2: View {
    @State var phase: CGFloat = 0.0
    @State var progress: CGFloat = 0.6
    
    var body: some View {
        VStack {
//            Slider(value: $progress, in: 0...1)
            Wave2(progress: progress, phase: phase)
                .fill(Color.blue)
//                .clipShape(Capsule())
//                .frame(width: 200)
                .onAppear() {
                    withAnimation(Animation.linear(duration: 1).repeatForever()) {
                        self.phase = .pi * 2
                    }
                }
        }
        
    }
}

struct WaveView2_Previews: PreviewProvider {
    static var previews: some View {
        WaveView2()
    }
}
