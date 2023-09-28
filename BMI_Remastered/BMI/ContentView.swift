//
//  ContentView.swift
//  BMI_ 2
//
//  Created by Victor Horn on 13.09.23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var bodyDataFields: Bool
    @ObservedObject var viewModel: BmiViewModel

    var body: some View {
        NavigationView {
            Form {
                Section("Your Data") {
                    TextField("Your Bodyheight", text: $viewModel.bodyHeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)
                    
                    TextField("Your Bodyweight", text: $viewModel.bodyWeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)
                }
                
                Section("Choose your Gender") {
                    Picker("Gender:", selection: $viewModel.selectedGender) {
                        ForEach(viewModel.genders, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Section {
                    Button {
                        viewModel.calculateBMI()
                    } label: {
                        Text("Calculate BMI")
                    }
                }
                
                if viewModel.yourBmi != nil {
                    Section("More nice things to know") {
                        NavigationLink {
                            IdealWeight(viewModel: viewModel)
                        } label: {
                            Text("Calculate my idealweight")
                        }
                        
                        NavigationLink {
                            BmiChartView(viewModel)
                        } label: {
                            Text("Look at your BMI at a Chart")
                        }
                        
                        NavigationLink {
                            BAIView(viewModel: viewModel)
                        } label: {
                            Text("Calculate your BAI")
                        }
                    }
                }
                
            }
            .navigationTitle("BMI \(viewModel.yourBmiString)")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    
                    Button("Done") {
                        bodyDataFields = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
