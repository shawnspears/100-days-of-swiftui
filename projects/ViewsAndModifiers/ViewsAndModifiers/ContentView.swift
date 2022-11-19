//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shawn Spears on 11/17/22.
//

import SwiftUI

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}

extension View {
    func blueTitleStyle() -> some View {
        modifier(BlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .blueTitleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
