//
//  BAIData.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 14.01.24.
//

import Foundation
import SwiftData

@Model
class BAIData {
    var dataBai: Double
    var date: Date

    init(dataBai: Double, date: Date = .now) {
        self.dataBai = dataBai
        self.date = date
    }
}
