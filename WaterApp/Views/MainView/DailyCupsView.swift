//
//  DailyCupsView.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

struct DailyCupsView: View {
    var body: some View {
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
    }
}

struct DailyCupsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyCupsView()
    }
}
