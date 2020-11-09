//
//  StateWaveView.swift
//  WaterApp
//
//  Created by Aiur on 07.11.2020.
//

import SwiftUI

struct StateWaveView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 150) {
            Text("1.9 / 3")
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            Text("65 %")
                .foregroundColor(.white)
                .bold()
                .font(.title)
        }
    }
}

struct StateWaveView_Previews: PreviewProvider {
    static var previews: some View {
        StateWaveView()
    }
}
