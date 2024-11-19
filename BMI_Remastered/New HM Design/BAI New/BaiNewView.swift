//
//  BaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.12.23.
//

import SwiftUI
import SwiftData
import UIKit

struct BaiNewView: View {
    @ObservedObject var viewModel: BmiViewModel
    @FocusState private var hipDataField: Bool
    
    @Environment(\.modelContext) var baiContenxt
    @Query private var datas: [BAIData] // TODO: - Variable not used, delete it

    @State private var showBaiSaveAlert = false
    @State private var showMeningBaiSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack(spacing: 20) {
                        Text("The BAI is an alternative to the BMI, which is calculated based on hip circumference in relation to your height.")
                            .font(.body)
                            .foregroundColor(Color("appOrange"))
                        
                        Divider()
                        
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
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                                    print("BAI saved!")
                                })
                            )
                        }
                        .padding(.bottom, 10)
                        
                        Divider()
                        
                        VStack {
                            HStack {
                                Text("Height")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text("\(viewModel.storedBodyHeight) cm")
                                    .foregroundColor(Color("appOrange"))
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Weight")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text("\(viewModel.bodyWeight) kg")
                                    .foregroundColor(Color("appOrange"))
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack {
                            Text("Your BAI:")
                                .foregroundColor(Color("appOrange"))
                                .font(.title)
                            
                            Text("\(viewModel.calculatedBaiString)")
                                .foregroundColor(Color("appOrange"))
                                .font(.title2)
                        }
                        
                        Divider()
                        
                        Button {
                            showMeningBaiSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "lightbulb.min")
                                Text("What is the meaning of my BAI?")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .modifier(ButtonStyle())
                        Spacer()
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
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
