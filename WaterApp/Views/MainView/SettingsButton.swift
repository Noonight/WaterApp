//
//  SettingsButton.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

struct SettingsButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "gear")
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(.blue)
        })
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
