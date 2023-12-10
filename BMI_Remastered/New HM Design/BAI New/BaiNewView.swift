//
//  BaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.12.23.
//

import SwiftUI
import SwiftData

struct BaiNewView: View {
    @ObservedObject var viewModel: BmiViewModel
    @FocusState private var hipDataField: Bool
    
    @Environment(\.modelContext) var baiContenxt
    @Query private var datas: [BAIData]
    
    @State private var showBaiSaveAlert = false
    @State private var showMeningBaiSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack(spacing: 20) {
                    Text("The BAI is an alternative to the BMI, which is calculated based on hip circumference in relation to your height.")
                        .foregroundColor(Color("appOrange"))
                    
                    TextField("Enter your Hip circumference", text: $viewModel.hipCircumference)
                        .keyboardType(.decimalPad)
                        .focused($hipDataField)
                        .modifier(TextFieldStyle())
                    
                    Button {
                        viewModel.calculateBAI()
                        showBaiSaveAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.forwardslash.minus")
                            Text("Calculate BAI")
                        }
                    }
                    .disabled(viewModel.hipCircumference.isEmpty)
                    .modifier(ButtonStyle())
                    .alert(isPresented: $showBaiSaveAlert) {
                        Alert(
                            title: Text("Save BAI"),
                            message: Text("Do you want to save your BAI?"),
                            primaryButton: .destructive(Text("Cancel")),
                            secondaryButton: .default(Text("Save"), action: {
                                guard let bais = viewModel.yourBai else { return }
                                baiContenxt.insert(BAIData(dataBai: bais, date: .now))
                            })
                        )
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        VStack {
                            Text("Hip")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.hipCircumference) cm")
                                .foregroundColor(Color("appOrange"))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Height")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.bodyHeight) cm")
                                .foregroundColor(Color("appOrange"))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Weight")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.bodyWeight) kg")
                                .foregroundColor(Color("appOrange"))
                        }
                    }
                    
                    HStack {
                        Text("Your BAI:")
                            .foregroundColor(Color("appOrange"))
                        
                        Spacer()
                        
                        Text("\(viewModel.yourBaiString)")
                            .foregroundColor(Color("appOrange"))
                    }

                    Button {
                        showMeningBaiSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "lightbulb.min")
                            Text("What is the meaning of my BAI?")
                        }
                    }
                    .modifier(ButtonStyle())
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("BAI")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .sheet(isPresented: $showMeningBaiSheet) {
                MeaningOfBaiNewView()
            }
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
}

#Preview {
    BaiNewView(viewModel: BmiViewModel())
}
