//
//  ContentView.swift
//  VolConvert
//
//  Created by Shawn Spears on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var inputUnit: String = "milliliters"
    @State private var outputUnit: String = "liters"
    
    private let units = ["milliliters", "liters", "cups", "pints", "gallons"]
    @FocusState private var volIsFocused: Bool
    
    var output: String {
        let inputToMilliliters: Double
        let milliliterssToOutput: Double
        
        switch inputUnit {
        case "liters":
            inputToMilliliters = 1000
        case "cups":
            inputToMilliliters = 236.588
        case "pints":
            inputToMilliliters = 473.176
        case "gallons":
            inputToMilliliters = 3785.412
        default:
            inputToMilliliters = 1.0
        }
        
        switch outputUnit {
        case "liters":
            milliliterssToOutput = 0.001
        case "cups":
            milliliterssToOutput = 0.00422675
        case "pints":
            milliliterssToOutput = 0.00211338
        case "gallons":
            milliliterssToOutput = 0.000264172
        default:
            milliliterssToOutput = 1.0
        }
        
        let inputMilliliters = input * inputToMilliliters
        let output = inputMilliliters * milliliterssToOutput
        let outputString = output.formatted()
        return "\(outputString) \(outputUnit)"
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Starting Volume", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($volIsFocused)
                } header: {
                    Text("Amount to convert")
                }

                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    Text(output)
                } header: {
                    Text("Output")
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
