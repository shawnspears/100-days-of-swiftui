//
//  ContentView.swift
//  Animations
//
//  Created by Shawn Spears on 11/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var isShowingAnimationTitle = false
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingAnimationTitle.toggle()
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                               value: animationAmount
                              )
            )
            .onAppear {
                animationAmount = 2
            }
            
            if isShowingAnimationTitle {
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(dragAmount)
                            .animation(
                                .default.delay(Double(num) / 20),
                                value: dragAmount
                            )
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            dragAmount = .zero
                            enabled.toggle()
                        }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
