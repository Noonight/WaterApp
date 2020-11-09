//
//  Triangle.swift
//  WaterApp
//
//  Created by Aiur on 31.10.2020.
//

import SwiftUI

//struct Triangle: Shape {
//    let size: Double
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: .zero)
//        path.addLine(to: CGPoint(x: 0.0, y: size))
//        path.addLine(to: CGPoint(x: size, y: size / 2))
////        path.addLine(to: CGPoint(x: 0, y: 0))
//        path.closeSubpath()
//
//        return path
//    }
//}

enum CupScheduleState {
    case success
    case fail
    case notYet
}

struct CupScheduleView: View {
    @State var size: Double
    @State var status: CupScheduleState
    
    var body: some View {
        switch status {
        case .success:
//            Triangle(size: size)
//                .fill(Color.blue)
//                .frame(width: CGFloat(size), height: CGFloat(size), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .rotationEffect(.degrees(90))
//                .background(Color.white)
            Image(systemName: "cylinder.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: CGFloat(size - (size / 3)), height: CGFloat(size))
                .background(Color.white)
        case .fail:
//            Triangle(size: size)
//                .fill(Color.black)
//                .frame(width: CGFloat(size), height: CGFloat(size), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .rotationEffect(.degrees(90))
//                .background(Color.white)
            Image(systemName: "cylinder.fill")
                .resizable()
                .foregroundColor(.black)
                .frame(width: CGFloat(size - (size / 3)), height: CGFloat(size))
                .background(Color.white)
        case .notYet:
//            Triangle(size: size)
//                .stroke(Color.black, lineWidth: 2)
//                .frame(width: CGFloat(size), height: CGFloat(size), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .rotationEffect(.degrees(90))
//                .background(Color.white)
            Image(systemName: "cylinder")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: CGFloat(size - (size / 3)), height: CGFloat(size))
                .background(Color.white)
        }
        
        
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        CupScheduleView(size: 100, status: .success)
    }
}
