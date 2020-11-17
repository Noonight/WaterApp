//
//  ProgressRectangleView.swift
//  WaterApp
//
//  Created by Aiur on 17.11.2020.
//

import SwiftUI

struct ProgressRectangle: Shape {
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let progressHeight = rect.height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))

        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
    }
}

struct ProgressRectangleView: View {
    @State var progress: CGFloat = 0.0
    private var wantedProgress: CGFloat = 0.0
    var animated: Bool = false
    
    init(progress: CGFloat, animated: Bool) {
        self.animated = animated
        self.progress = 0.0
        if self.animated {
            self.progress = 0.0
            self.wantedProgress = progress
        } else {
            self.progress = progress
            self.wantedProgress = progress
        }
    }
    
    let animation = Animation.linear.repeatForever().speed(0.3)
    
    var body: some View {
        ProgressRectangle(progress: progress)
            .fill(Color.blue)
//            .frame(width: 100, height: 300)
//            .overlay(
//                Rectangle()
//                    .stroke(Color.red, lineWidth: 1.0)
//            )
//            .animation(animated ? .easeOut : nil)
            .animation(animated ? animation : nil)
            .onAppear {
                    self.progress = wantedProgress
            }
    }
}

struct ProgressRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRectangleView(progress: 0.9, animated: true)
    }
}
