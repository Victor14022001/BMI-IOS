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
    @Query private var datas: [BMIData] // TODO: Ungenutze Variable, da die stelle nur zum Debuggen genutzt wurde. Kannst beides entfernen hier und unten

    var body: some View {
        NavigationView {
            List {
                Section("Your Data") {
                    TextField("Your Bodyheight", text: $viewModel.bodyHeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)

                    TextField("Your Bodyweight", text: $viewModel.bodyWeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)
                }

                Section("This Date will be saved") {
                    HStack {
                        Text("Date")

                        Spacer()

                        Text("\(Date.now.formatted(date: .complete, time: .omitted))")
                    }
                }

                Section {
                    Button {
                        viewModel.calculateBMI()
                        showAlert = true
                    } label: {
                        Text("Calculate BMI")
                    }
                    .disabled(viewModel.bodyHeight.isEmpty || viewModel.bodyWeight.isEmpty)
                }

                if viewModel.yourBmi != nil {
                    Section("More nice things to know") {
                        NavigationLink {
                            MeaningOfBMIView()
                        } label: {
                            Text("Meaning of my BMI")
                        }
                    }

                    NavigationLink {
                        IdealWeight(viewModel: viewModel)
                    } label: {
                        Text("Calculate my idealweight")
                    }
                    .onAppear(perform: {
                        viewModel.calculateIdealWeight()
                    })

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
            .navigationTitle("BMI \(viewModel.yourBmiString)")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {

                    Spacer()

                    Button("Done") {
                        bodyDataFields = false
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
                        context.insert(BMIData(bmi: bmi, date: .now))
                        // TODO: War nur für Debugging gedacht, kann weg
                        datas.forEach {
                            print($0.bmi)
                        }
                    })
                )
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
