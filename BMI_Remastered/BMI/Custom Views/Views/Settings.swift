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
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    } 
}

#Preview {
    Settings(viewModel: BmiViewModel())
}
