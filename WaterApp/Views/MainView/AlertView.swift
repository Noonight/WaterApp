//
//  AlertView.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

struct AlertView: View {
    
    private func getStrTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return "You didn't drink at \(dateFormatter.string(from: date)). One more cup?"
    }
    
    @State var time: Date
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color.red)
//                .border(Color.black, width: 1)
            .frame(height: 30)
            
            .overlay(
                Text(getStrTime(date: time))
                    .foregroundColor(.white)
                    .bold()
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(time: Date())
            .padding([.leading, .trailing])
    }
}
