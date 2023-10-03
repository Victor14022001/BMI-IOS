//
//  ContentView.swift
//  BMI_ 2
//
//  Created by Victor Horn on 13.09.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @FocusState private var bodyDataFields: Bool
    @ObservedObject var viewModel: BmiViewModel
    
    @State private var showAlert = false
    
    @Environment(\.modelContext) var context
    @Query private var datas: [BMIData]
    
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
                
                Section("Choose a date for your saved BMI") {
                    DatePicker(selection: $viewModel.chooseDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Choose a Date")
                    }
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
                        showAlert = true
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
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save BMI"),
                    message: Text("Do you want to save your BMI?"),
                    primaryButton: .destructive(Text("Cancel")),
                    secondaryButton: .default(Text("Save"), action: {
                        guard let bmi = viewModel.yourBmi else { return }
                        let date = viewModel.chooseDate
                        context.insert(BMIData(bmi: bmi, date: date))
                        datas.forEach {
                            print($0.bmi, $0.date)
                        }
                    })
                )
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
