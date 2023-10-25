//
//  Settings.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI
import SwiftData

struct Settings: View {
    @ObservedObject var viewModel: BmiViewModel
    
    @Environment(\.modelContext) var context
    @Query private var datas: [BMIData]
    
    @State private var showDeleteAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Color Scheme") {
                    Toggle("Darkmode", isOn: $viewModel.isDarkmodeEnabled)
                }
                
                NavigationLink {
                    BMIDataView()
                } label: {
                    Text("Show my BMI's")
                }
                
                NavigationLink {
                    BmiDataChartView()
                } label: {
                    Text("BMI History Chart")
                }
                
                Section("Delete your saved BMI's") {
                    Button {
                        showDeleteAlert = true
                    } label: {
                        Text("Delete all data")
                    }
                }
            }
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Are you sure to delete all saved BMI's"),
                    message: Text("If you press 'Yes' all saved BMI's will be deleted"),
                    primaryButton: .destructive(Text("Cancel")),
                    secondaryButton: .default(Text("Yes"), action: {
                        do {
                            try context.delete(model: BMIData.self)
                        } catch {
                            print("Failed to delete data")
                        }
                    })
                )
            }
            
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Settings(viewModel: BmiViewModel())
}
