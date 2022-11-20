//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Shawn Spears on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = true
    @State private var numQuestions = 1
    @State private var gameOver = false
    
    let moves = [("Rock", "Paper"),  ("Paper", "Scissors"), ("Scissors", "Rock")]
    let symbols = ["circle", "paperplane.fill", "scissors"]

    
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
                
                VStack(spacing: 20) {
                    VStack {
                        Text("The app chose:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(moves[appMove].0)
                            .font(.largeTitle.weight(.semibold))
                        Text("Choose the correct move in order to " + (shouldWin ? "WIN" : "LOSE"))
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        ForEach(0..<3) {number in
                            Button {
                                moveTapped(number)
                            } label: {
                                Image(systemName: symbols[number])
                                    .renderingMode(.original)
                                    .font(.system(size: 72))
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Question: \(numQuestions)/10")
                    .foregroundColor(.gray)
                    .font(.headline.weight(.semibold))
                Text("Score: \(score)")
                    .foregroundColor(.gray)
                    .font(.largeTitle.weight(.semibold))
                
                Spacer()
            }
            .padding()
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Restart Game", action: restartGame)
        } message: {
            Text("Your final score is \(score)")
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func restartGame() {
        numQuestions = 0
        score = 0
        gameOver = false
        askQuestion()
    }
    
    func askQuestion() {
        if numQuestions == 10 {
            gameOver = true
            showingScore = false
        } else {
            appMove = Int.random(in: 0...2)
            shouldWin.toggle()
            numQuestions += 1
        }
    }
    
    func moveTapped(_ number: Int) {
        let move = moves[number].0
        if shouldWin {
            if move == moves[appMove].0 {
                scoreTitle = "Draw"
            } else if move == moves[appMove].1 {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
                score -= 1
            }
        } else {
            if move == moves[appMove].0 {
                scoreTitle = "Draw"
            } else if move == moves[appMove].1 {
                scoreTitle = "Wrong"
                score -= 1
            } else {
                scoreTitle = "Correct"
                score += 1
            }
        }
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
