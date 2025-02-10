//
//  DiaryData.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 14.01.24.
//

import Foundation
import SwiftData

@Model
class DiaryData {
    var title: String
    var detail: String
    var date: Date

    init(title: String, detail: String, date: Date = .now) {
        self.title = title
        self.detail = detail
        self.date = date
    }
}
