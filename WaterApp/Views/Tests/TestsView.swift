//
//  TestsView.swift
//  WaterApp
//
//  Created by Aiur on 16.11.2020.
//

import SwiftUI

struct TestsView: View {

    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .inset(by: 4)
                .fill(Color.blue)
            Text("Hello, World!")
                .font(.headline)
        }
    }
}

struct TestsView_Previews: PreviewProvider {
    static var previews: some View {
        TestsView()
    }
}
