//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Shawn Spears on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = true

    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .gray, location: 0.3),
                .init(color: .white, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("The app chose:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(moves[appMove])
                            .font(.largeTitle.weight(.semibold))
                        Text("Choose the correct move in order to " + (shouldWin ? "WIN" : "LOSE"))
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.gray)
                    .font(.largeTitle.weight(.semibold))
                
                Spacer()
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
