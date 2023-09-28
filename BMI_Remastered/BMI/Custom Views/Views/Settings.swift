//
//  Settings.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var viewModel: BmiViewModel
    @State private var darkMode = false
    
    var body: some View {
        Form {
            Section("Color Scheme") {
                Toggle(isOn: $darkMode, label: {
                    Text("Darkmode")
                    // should change the Color Scheme
                })
            }
        }
        MyTabView()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
} 

#Preview {
    Settings(viewModel: BmiViewModel())
}
