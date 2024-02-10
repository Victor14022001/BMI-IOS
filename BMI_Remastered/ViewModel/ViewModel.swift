//
//  ViewModel.swift
//  BMI_ 2
//
//  Created by Victor Horn on 13.09.23.
//

import Foundation
import SwiftUI

class BmiViewModel: NSObject, ObservableObject {
    // MARK: - AppStorage
    @AppStorage("isDarkModeEnabled") var isDarkmodeEnabled: Bool = false
    @AppStorage("waterPushNotifications") var waterNotifications: Bool = false
    
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
    
    @Published var drinkWaterNotification = false
    
    func calculateBMI() {
        guard let height = Double(bodyHeight), let weight = Double(bodyWeight) else { return }
        let calculatedBmi = weight / ((height / 100) * (height / 100))
        yourBmi = calculatedBmi
        yourBmiString = String(format: "%.2f", calculatedBmi)
    }
    
    func calculateIdealWeight() {
        guard let height = Double(bodyHeight) else { return }
        let idealWeight = (height - 100) + 1
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
    
    func drinkWaterReminder() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [self] success, error in
            if success {
                print("Success")
                dailyNotifications(title: "HealthMetrics", subtitle: "Get started \n road to 1 Liter", hour: 8, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Hydrate yourself \n road to 1 Liter", hour: 9, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Remember your Goal \n road to 1 Liter", hour: 10, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Keep chugging \n road to 1 Liter", hour: 11, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Don't give up \n road to 1 Liter", hour: 12, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Welldone \n you drank 1 Liter", hour: 13, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Get started \n road to 2 Liter", hour: 14, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Hydrate yourself \n road to 2 Liter", hour: 15, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Remember your Goal \n road to 2 Liter", hour: 16, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Keep chugging \n road to 2 Liter", hour: 17, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Don't give up \n road to 2 Liter", hour: 18, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Welldone \n you drank 2 Liter", hour: 19, minute: 0)
                dailyNotifications(title: "HealthMetrics", subtitle: "Jaeh! You drank 2 Liter but please drink more", hour: 20, minute: 30)
                
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func dailyNotifications(title: String, subtitle: String, hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        if waterNotifications == true {
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let notificationsID = UUID().uuidString
            let request = UNNotificationRequest(identifier: notificationsID, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        } else {
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
}
