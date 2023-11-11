//
//  ViewModel.swift
//  BMI_ 2
//
//  Created by Victor Horn on 13.09.23.
//

import Foundation
import SwiftUI
import UIKit
import SwiftData
import Charts
import MessageUI

@Model
class BAIData {
    let dataBai: Double
    let date: Date
    
    init(dataBai: Double, date: Date = .now) {
        self.dataBai = dataBai
        self.date = date
    }
}

@Model
class Diary {
    let title: String
    let detail: String
    let date: Date
    
    init(title: String, detail: String, date: Date = .now) {
        self.title = title
        self.detail = detail
        self.date = date
    }
}

@Model
class BMIData: Identifiable {
    let dataBmi: Double
    let date: Date
    
    init(dataBmi: Double, date: Date = .now) {
        self.dataBmi = dataBmi
        self.date = date
    }
}

class BmiViewModel: NSObject, ObservableObject {
    // MARK: - AppStorage
    @AppStorage("isDarkModeEnabled") var isDarkmodeEnabled: Bool = false
    
    // MARK: - Published
    @Published var bodyWeight = ""
    @Published var bodyHeight = ""
    
    @Published var yourBmi: Double?
    @Published var yourBmiString: String = ""
    
    @Published var yourIdealWeight: Double?
    @Published var yourIdealWeightString: String = ""
    
    @Published var selectedGender = "Male"
    @Published var genders = ["Male", "Female"]
    
    @Published var chooseDate: Date = Date.now
    
    @Published var averageBodyWeight: String = "28"
    
    @Published var hipCircumference: String = ""
    @Published var yourBai: Double?
    @Published var yourBaiString: String = ""
    
    func calculateBMI() {
        guard let height = Double(bodyHeight), let weight = Double(bodyWeight) else { return }
        let calculatedBmi = weight / ((height / 100) * (height / 100))
        yourBmi = calculatedBmi
        yourBmiString = String(format: "%.2f", calculatedBmi)
    }
    
    func calculateIdealWeight() {
        guard let height = Double(bodyHeight) else { return }
        let idealWeight = selectedGender == "Male" ? (height - 100) + 1 : (height - 110) + 1
        yourIdealWeight = idealWeight
        yourIdealWeightString = String(format: "%.2f", idealWeight)
    }
    
    func calculateBAI() {
        guard let hipCircumference = Double(hipCircumference), let height = Double(bodyHeight) else { return }
        let heightInMeters = height / 100.0
        let calculatedBai = (hipCircumference / pow(heightInMeters, 1.5)) - 18
        let roundedBAI = (calculatedBai * 100).rounded() / 100
        yourBai = roundedBAI
        yourBaiString = String(format: "%.2f", roundedBAI)
    }
}
