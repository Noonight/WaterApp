//
//  TopBarView.swift
//  WaterApp
//
//  Created by Aiur on 05.11.2020.
//

import SwiftUI

struct TopBarWaveView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                HStack(alignment: .center) {
                    Image(systemName:"chart.bar.xaxis")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                        .foregroundColor(.blue)
                    Text("Wednesday").foregroundColor(.blue)
                }
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundColor(.blue)
            })
        }
        .padding()
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarWaveView()
            .previewLayout(.sizeThatFits)
    }
}
