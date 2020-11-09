//
//  ButtonsView.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

struct BtnItem: Identifiable {
    var id = UUID()
    var image: Image
    var capacity: Capacities
    
    init(image: Image, capacity: Capacities) {
        self.image = image
        self.capacity = capacity
    }
    
    init(imageName: String, capacity: Capacities) {
        self.image = Image(systemName: imageName)
        self.capacity = capacity
    }
}

struct ButtonsView: View {
    
    var capacityBtns: [BtnItem] = []
    
//    init(capacityBtns: [BtnItem]) {
    init() {
//        self.capacityBtns = capacityBtns
        self.capacityBtns.append(BtnItem(imageName: "cylinder.fill", capacity: .ml250))
        self.capacityBtns.append(BtnItem(imageName: "macpro.gen2.fill", capacity: .ml1000))
        self.capacityBtns.append(BtnItem(imageName: "loupe", capacity: .ml500))
        self.capacityBtns.append(BtnItem(imageName: "graduationcap.fill", capacity: .ml1000))
        self.capacityBtns.append(BtnItem(imageName: "drop.fill", capacity: .custom))
        
        print(capacityBtns)
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 20) {
            ForEach(capacityBtns) { (btn: BtnItem) in
                VStack(spacing: 5) {
//                    Image(systemName: "cylinder.fill")
                    btn.image
                        .resizable()
                        .frame(width: 30, height: 40)
                        .foregroundColor(.blue)
//                    Text("250ML").black()
                    Text(btn.capacity.rawValue).black()
                }//.background(Color.black)
            }
//            Text("Hi")
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
