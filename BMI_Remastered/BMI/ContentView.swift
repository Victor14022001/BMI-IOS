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
                        IdealweightView(viewModel: viewModel)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {

                    Spacer()

                    Button("Done") {
                        bodyDataFields = false
                    }
                }
            }
            .navigationTitle("BMI \(viewModel.yourBmiString)")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save BMI"),
                    message: Text("Do you want to save your BMI?"),
                    primaryButton: .destructive(Text("Cancel")),
                    secondaryButton: .default(Text("Save"), action: {
                        guard let bmis = viewModel.yourBmi else { return }
                          context.insert(BMIData(dataBmi: bmis, date: .now))
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
