//
//  ContentView.swift
//  UnitConversion
//
//  Created by Cathleen Vu on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "meters"
    @State private var inputValue = ""
    @State private var outputUnit = "feet"
    @FocusState private var inputFocused: Bool
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    let conversionValuesFromMeters = [
        "meters": 1.0,
        "kilometers": 0.001,
        "feet": 3.28084,
        "yard": 1.09361,
        "miles": 0.000621371
    ]
    
    var unitConversion: Double {
        guard let inputDouble = Double(inputValue),
              let getMeters = conversionValuesFromMeters[inputUnit],
              let getOutputUnit = conversionValuesFromMeters[outputUnit] else {
            return 0.0
        }
        let inputInMeters = inputDouble / getMeters
        let convertedOutput = inputInMeters * getOutputUnit
        return convertedOutput
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input unit") {
                    TextField("Input", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .focused($inputFocused)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Value") {
                    Text("\(unitConversion, specifier: "%.2f") \(outputUnit)")
                }
                
            }
            .navigationTitle("Unit Conversion")
            .toolbar {
                if inputFocused {
                    Button("Done") {
                        inputFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
