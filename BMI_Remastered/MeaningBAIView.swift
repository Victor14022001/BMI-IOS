//
//  MeaningBAIView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.09.23.
//

import SwiftUI

struct MeaningBAIView: View {
    @StateObject var viewModel: BmiViewModel
    
    var body: some View {
        Form {
            Section {
                Text("Underweight")
                    .font(.title2)
                Text("BAI under 8:")
                Text("People with a very low body fat percentage may fall into this category.")
            }
            
            Section {
                Text("Healthy Weightt")
                    .font(.title2)
                Text("BAI between 8 and 21:")
                Text("A BAI value in this range is usually considered a healthy body weight.")
            }
            
            Section {
                Text("Overweight")
                    .font(.title2)
                Text("BAI over 26:")
                Text("A BAI value above 26 can indicate high body fat and is often considered a sign of obesity")
            }
            
            Section {
                Text("Obesity")
                    .font(.title2)
                Text("BAI between 21 and 26:")
                Text("A higher BAI value may indicate a higher percentage of body fat, which is classified as overweight.")
            }
            
            Section {
                Text("Note")
                    .font(.title2)
                Text("""
                     The BAI is just one of many metrics for assessing your health, and it may not provide a complete picture on its own. Always consult with a healthcare professional for a comprehensive evaluation of your health and body composition. Remember that maintaining a healthy lifestyle through proper diet and regular exercise is key to overall well-being.
                     
                     Enjoy using the App, and stay committed to a healthier you!
                     """)
            }
        }
        .navigationTitle("Meaning of your BAI")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeaningBAIView_Previews: PreviewProvider {
    static var previews: some View {
        MeaningBAIView(viewModel: BmiViewModel())
    }
}
