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
    var body: some Scene {
        WindowGroup {
            MyTabViewNew()
        }
        .modelContainer(for: [BMIData.self, DiaryData.self, BAIData.self, WaterData.self])
    }
}

// TODO: - Check all files for Trailing Whitespaces i have 185 Warnings in Swiftlint!
// TODO: - Change deprecated foregroundColor to foregroundStyle
