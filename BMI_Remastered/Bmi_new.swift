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
            MyTabView()
        }
        .modelContainer(for: [BMIData.self, Diary.self, BAIData.self])
    }
}