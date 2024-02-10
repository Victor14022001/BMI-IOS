//
//  BMIDA0.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 14.01.24.
//

import Foundation
import SwiftData

@Model
class BMIData: Identifiable {
    let dataBmi: Double
    let date: Date

    init(dataBmi: Double, date: Date = .now) {
        self.dataBmi = dataBmi
        self.date = date
    }
}
