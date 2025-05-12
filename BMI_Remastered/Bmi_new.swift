//
//  BMI__2App.swift
//  BMI_ 2
//
//  Created by Victor Horn on 13.09.23.
//

import SwiftUI
import SwiftData

@main
struct Bmi_new: App {
  
    var viewModel = BmiViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.choosenDesign == "HealthMetrics design" {
                MyTabView()
            } else {
                MyTabViewNew()
            }
               
             
            
            
        }
        .modelContainer(for: [BMIData.self, DiaryData.self, BAIData.self, WaterData.self])
    }
}

// TODO: - Change deprecated foregroundColor to foregroundStyle
