//
//  WaterData.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.02.24.
//

import Foundation
import SwiftData

@Model
class WaterData {
    let drankWater: Int
    let drankWaterDate: Date
    
    init(drankWater: Int, drankWaterDate: Date = .now) {
        self.drankWater = drankWater
        self.drankWaterDate = drankWaterDate
    }
    
}
