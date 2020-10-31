//
//  ContentView.swift
//  WaterApp
//
//  Created by Aiur on 29.10.2020.
//

import SwiftUI
import CoreData

struct BlackText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
    }
}

extension Text {
    func black() -> some View {
        self.modifier(BlackText())
    }
}

struct ContentView: View {
    @State private var progress = 0.6
    @State private var waveLength = 5.0
    
    var body: some View {
        VStack(spacing: 0) {
            
            WaveView(progress: progress, strength: waveLength)
                .overlay(
                    HStack {
                        Button {
                            print("Open statistic window")
                        } label: {
                            Label(
                                title: { Text("Wednesday").foregroundColor(.blue) },
                                icon: { Image(systemName:"chart.bar.xaxis")
                                    .foregroundColor(.blue)
                                }
                            )
                        }
                        Spacer()
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                    }
                    .padding()
//                    Spacer()
                    , alignment: .top
                )
                .overlay(
                    HStack {
                        Button {
                            
                        } label: {
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
                                        .bold()
                                    Text("Daily goal")
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(height: 100)
                            .padding([.leading, .trailing])
                            .offset(y: -16)
                        }
                    }
                    , alignment: .bottom
                )
                .overlay(
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
                )
            
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.white)
//                    .border(Color.black, width: 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your daily schedule")
                        .black()
                        .padding([.leading, .trailing])
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 0.5)
                            .frame(height: 1)
                            .foregroundColor(.black)
                            
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top) {
                                VStack {
                                    TriangleView(size: 20, status: .success)
                                    Text("09:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .fail)
                                    Text("11:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .success)
                                    Text("13:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .success)
                                    Text("15:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .success)
                                    Text("17:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .success)
                                    Text("19:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .notYet)
                                    Text("21:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .notYet)
                                    Text("22:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .notYet)
                                    Text("23:00").black()
                                }
                                VStack {
                                    TriangleView(size: 20, status: .notYet)
                                    Text("24:00").black()
                                }
                            }.padding([.leading, .trailing])
//                            .frame(height: 80)
//                            .offset(y: 15)
                        }
                    }
                }
            }
            .frame(height: 110)
            .offset(x: 0, y: -25)
            .padding(.bottom, -25)
            .padding([.leading, .trailing])
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.red)
//                .border(Color.black, width: 1)
                .frame(height: 30)
                
                .overlay(
                    Text("You didn't drink at 11:00. One more cup?")
                        .foregroundColor(.white)
                        .bold()
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding([.leading, .trailing])
                .offset(y: -1)
            
            HStack(alignment: .bottom, spacing: 20) {
                VStack(spacing: 5) {
                    Image(systemName: "cylinder.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .foregroundColor(.blue)
                    Text("250ML").black()
                }
                
                VStack(spacing: 5) {
                    Image(systemName: "macpro.gen2.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .foregroundColor(.blue)
                    Text("MACPRO").black()
                }
                
                VStack(spacing: 5) {
                    Image(systemName: "loupe")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                    Text("700ML").black()
                }
                
                VStack(spacing: 5) {
                    Image(systemName: "graduationcap.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .rotationEffect(.degrees(180))
                    Text("1000ML").black()
                }
                
                VStack(spacing: 5) {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .foregroundColor(.blue)
                    Text("CUSTOM").black()
                }
            }.padding([.top, .bottom])
        }//.edgesIgnoringSafeArea(.top)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
