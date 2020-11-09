//
//  WaveView.swift
//  WaterApp
//
//  Created by Aiur on 30.10.2020.
//

import SwiftUI

struct Wave: Shape {
    var strength: Double // Idea: increase values when user drink water
    var frequency: Double // and decrease to base when user don't
    var phase: Double
    var progress: Double
    
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath()
        var path = Path()
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
//        let midHeight = height / 2
        let oneOverMidWidth = 1 / midWidth
        let progressHeight = height * (1 - progress)

        let wavelength = width / frequency

        path.move(to: CGPoint(x: 0, y: progressHeight))

        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / wavelength
            
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
//            let parabola = normalDistance
            let parabola = -(normalDistance * normalDistance) + 1
            
            let sine = sin(relativeX + phase)

            let y = parabola * strength * sine + progressHeight

            path.addLine(to: CGPoint(x: x, y: y))

        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        
//        return Path(path.cgPath)
        return path
    }

}

struct WaveView: View {
    @State private var phase = 0.0
    @State var progress: Double// 0...1
    @State var strength: Double
    @State private var frequency = 5.0
    
    var body: some View {
        Wave(strength: strength, frequency: frequency, phase: phase, progress: progress)
            .fill(Color.blue)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.phase = .pi * 2
                }
            }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WaveView(progress: 0.3, strength: 10.0)
        }
    }
}
