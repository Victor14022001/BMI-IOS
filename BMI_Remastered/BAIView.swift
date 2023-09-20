//
//  BAIView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 16.09.23.
//

import SwiftUI
   
struct BAIView: View {
    @StateObject var viewModel = BmiViewModel()
    
    @FocusState private var hipDataField: Bool
    
    var body: some View {
        Form {
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
                } label: {
                    Text("Calculate BAI")
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
                    MeaningBAIView(viewModel: viewModel)
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
