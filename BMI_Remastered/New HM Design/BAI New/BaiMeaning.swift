//
//  BaiMeaning.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 05.06.24.
//

import Foundation
import SwiftUI

enum BAIMeaning: String, CaseIterable, Identifiable {
    case underweight, healthyWeight, overweight, obesity, note

    var id: String { self.rawValue }

    var title: String {
        switch self {
        case .underweight:
            return "Underweight"
        case .healthyWeight:
            return "Healthy Weight"
        case .overweight:
            return "Overweight"
        case .obesity:
            return "Obesity"
        case .note:
            return "Note"
        }
    }

    var subtitle: String {
        switch self {
        case .underweight:
            return "BAI under 8:"
        case .healthyWeight:
            return "BAI between 8 and 21:"
        case .overweight:
            return "BAI over 26:"
        case .obesity:
            return "BAI between 21 and 26:"
        case .note:
            return ""
        }
    }

    var description: String {
        switch self {
        case .underweight:
            return "People with a very low body fat percentage may fall into this category."
        case .healthyWeight:
            return "A BAI value in this range is usually considered a healthy body weight."
        case .overweight:
            return "A BAI value above 26 can indicate high body fat and is often considered a sign of obesity."
        case .obesity:
            return "A higher BAI value may indicate a higher percentage of body fat, which is classified as overweight."
        case .note:
            return """
            The BAI is just one of many metrics for assessing your health, and it may not provide a complete picture on its own. Always consult with a healthcare professional for a comprehensive evaluation of your health and body composition. Remember that maintaining a healthy lifestyle through proper diet and regular exercise is key to overall well-being.
            
            Enjoy using the App, and stay committed to a healthier you!
            """
        }
    }

    var foregroundColor: Color {
        switch self {
        case .underweight, .obesity, .note:
            return Color("appOrange")
        case .healthyWeight, .overweight:
            return Color("appBlue")
        }
    }
}
