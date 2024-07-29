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
