//
//  ContentView.swift
//  DetectingShakeGesture
//
//  Created by Ramill Ibragimov on 16.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var rolledNumberOne = 1
    @State var rolledNumberTwo = 1
    @State var rolledIt = false
    
    var body: some View {
        ZStack {
            ShakableViewRepresentable()
                .allowsHitTesting(false)
            
            VStack {
                HStack {
                    Image(systemName: rolledIt ? "\(rolledNumberOne).square.fill" : "square.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .opacity(0.6)
                        .padding(.top, 250)
                    
                    Image(systemName: rolledIt ? "\(rolledNumberTwo).square.fill" : "square.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .opacity(0.6)
                        .padding(.top, 250)
                }.padding()
                    
                Spacer()
                Text("Shake device to roll the dice!")
                    .padding(.bottom, 40)
                Spacer()
            }.onReceive(messagePublisher) { _ in
                self.rollDice()
            }
        }
    }
    
    func rollDice() {
        self.rolledNumberOne = Int.random(in: 1 ..< 7)
        self.rolledNumberTwo = Int.random(in: 1 ..< 7)
        self.rolledIt = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
