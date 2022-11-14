//
//  ContentView.swift
//  VolConvert
//
//  Created by Shawn Spears on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var startVol = 0.0
    @State private var startUnit: String = ""
    @State private var endVol = 0.0
    @State private var endUnit: String = ""
    
    private let units = ["mL", "L", "cups", "pints", "gallons"]
    @FocusState private var volIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Starting Volume", value: $startVol, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($volIsFocused)
                    Picker("Units", selection: $startUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert From")
                }

                Section {
                    Text(endVol, format: .number)
                    Picker("Units", selection: $endUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
            }
            .navigationTitle("VolConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        volIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
