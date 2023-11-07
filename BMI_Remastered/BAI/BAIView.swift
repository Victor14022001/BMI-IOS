//
//  BAIView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 16.09.23.
//

import SwiftUI
import SwiftData

struct BAIView: View {
    @ObservedObject var viewModel: BmiViewModel
    @FocusState private var hipDataField: Bool

    @Environment(\.modelContext) var baiContenxt
    @Query private var datas: [BAIData]

    @State private var showBaiSaveAlert = false

    var body: some View {
        List {
            Section("Description") {
                Text("The BAI is an alternative to the BMI, which is calculated based on hip circumference in relation to your height.")
            }

            Section("Enter your Hip circumference") {
                TextField("Enter your Hip circumference", text: $viewModel.hipCircumference)
                    .keyboardType(.decimalPad)
                    .focused($hipDataField)
            }

            Section {
                Button {
                    viewModel.calculateBAI()
                    showBaiSaveAlert = true
                } label: {
                    Text("Calculate BAI")
                }
                .disabled(viewModel.hipCircumference.isEmpty)
                .alert(isPresented: $showBaiSaveAlert) {
                    Alert(
                        title: Text("Save BAI"),
                        message: Text("Do you want to save your BAI?"),
                        primaryButton: .destructive(Text("Cancel")),
                        secondaryButton: .default(Text("Save"), action: {
                            guard let bais = viewModel.yourBai else { return }
                            baiContenxt.insert(BAIData(dataBai: bais, date: .now))
                            datas.forEach {
                                print($0.dataBai)
                            }
                        })
                    )
                }
            }

            Section("Overview") {
                HStack {
                    VStack {
                        Text("Hip")
                        Text("\(viewModel.hipCircumference) cm")
                    }

                    Spacer()

                    VStack {
                        Text("Height")
                        Text("\(viewModel.bodyHeight) cm")
                    }

                    Spacer()

                    VStack {
                        Text("Weight")
                        Text("\(viewModel.bodyWeight) kg")
                    }
                }
            }

            Section("Your BAI") {
                HStack {
                    Text("Your BAI:")

                    Spacer()

                    Text("\(viewModel.yourBaiString)")
                }
            }

            Section {
                NavigationLink {
                    MeaningBAIView()
                } label: {
                    Text("What is the meaning of my BAI?")
                }
            }
        }
        .navigationTitle("BAI")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {

                Spacer()

                Button("Done") {
                    hipDataField = false
                }
            }
        }
    }
}

struct BAIView_Previews: PreviewProvider {
    static var previews: some View {
        BAIView(viewModel: BmiViewModel())
    }
}
