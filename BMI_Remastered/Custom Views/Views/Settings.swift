//
//  Settings.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var viewModel: BmiViewModel
    
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
                    Text("Look at your BMI's")
                }
                
                Section("New Design") {
                    NavigationLink {
                        HomeView()
                    } label: {
                        Text("New Design (HomeView")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    } 
}

#Preview {
    Settings(viewModel: BmiViewModel())
}
