//
//  BottomBarWaveView.swift
//  WaterApp
//
//  Created by Aiur on 05.11.2020.
//

import SwiftUI

struct BottomBarWaveView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.white)
                    Text("6/10")
                        .foregroundColor(.white)
                        .bold()
                }
                Text("300ML Cups")
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("3000ML")
                    .foregroundColor(.white)
                    .font(.system(.body, design: .rounded))
                Text("Daily goal")
                    .foregroundColor(.white)
                    .font(.system(.body, design: .rounded))
            }
        }
        .frame(height: 100)
        .padding([.leading, .trailing])
    }
}

struct BottomBarWaveView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarWaveView()
            
    }
}
