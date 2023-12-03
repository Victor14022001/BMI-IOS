//
//  ContentBmiViewNew.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 25.11.23.
//

import SwiftUI
import SwiftData
import UIKit

struct ContentBmiViewNew: View {
    @FocusState private var bodyDataFields: Bool
    @ObservedObject var viewModel: BmiViewModel
    @Query private var datas: [BMIData]
    @Environment(\.modelContext) var context
    
    @State private var showAlert = false
    @State private var showMeaningOfBmiSheet = false
    @State private var showBmiDataChartSheet = false
    @State private var showIdealweightSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appBlue")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    TextField("Your Bodyheight", text: $viewModel.bodyHeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)
                        .modifier(TextFieldStyle())
                    TextField("Your Bodyweight", text: $viewModel.bodyWeight)
                        .keyboardType(.decimalPad)
                        .focused($bodyDataFields)
                        .modifier(TextFieldStyle())

                    HStack {
                        Text("Date")
                        Spacer()
                        Text("\(Date.now.formatted(date: .complete, time: .omitted))")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("appOrange"))
                    .font(.system(size: 24))

                    Button {
                        viewModel.calculateBMI()
                        showAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.forwardslash.minus")
                            Text("Calculate BMI")
                        }
                    }
                    .modifier(ButtonStyle())
                    .disabled(viewModel.bodyHeight.isEmpty || viewModel.bodyWeight.isEmpty)

                    Menu("More Informations") {
                        Menu("BMI") {
                            Button("Meaning of my BMI", systemImage: "lightbulb.min") {
                                showMeaningOfBmiSheet = true
                            }
                            Button("Bmi History Chart", systemImage: "chart.xyaxis.line") {
                                showBmiDataChartSheet = true
                            }
                        }
                        Menu("BAI") {
                            Button("Bai Test") { }
                            Button("Bai Test") { }
                        }
                        Button("Idealweight", systemImage: "plus.forwardslash.minu") {
                            showIdealweightSheet = true
                        }
                    }
                    .modifier(ButtonStyle())

                    if viewModel.yourBmi != nil {
                        

                        
                        
                        NavigationLink {
                            BmiChartView(viewModel)
                        } label: {
                            HStack {
                                Image(systemName: "chart.bar.xaxis")
                                Text("Look at your BMI at a Chart")
                            }
                        }
                        .modifier(ButtonStyle())
 
                        NavigationLink {
                            BAIView(viewModel: viewModel)
                        } label: {
                            HStack {
                                Image(systemName: "plus.forwardslash.minus")
                                Text("Calculate your BAI")
                            }
                        }
                        .modifier(ButtonStyle())
                    }
                    Spacer()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Spacer()
                        
                        Button("Done") {
                            bodyDataFields = false
                        }
                    }
                }
                .padding()
                .navigationTitle("BMI \(viewModel.yourBmiString)")
                .preferredColorScheme(.dark)
  
                .sheet(isPresented: $showMeaningOfBmiSheet) {
                    MeaningOfBmiNewView()
                    }
                
                .sheet(isPresented: $showBmiDataChartSheet) {
                    BmiDataChartNewView()
                    }
                
                .sheet(isPresented: $showIdealweightSheet) {
                    IdealweightNewView(viewModel: viewModel)
                        .onAppear(perform: {
                            viewModel.calculateIdealWeight()
                        })
                }

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
}

#Preview {
    ContentBmiViewNew(viewModel: .init())
}
