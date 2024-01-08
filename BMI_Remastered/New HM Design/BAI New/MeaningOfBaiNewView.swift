//
//  MeaningOfBaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.12.23.
//

import SwiftUI

struct MeaningOfBaiNewView: View {
    // TODO: - Big body with a lot of text, create Enumerate BAIMeaning with cases for all different meanings and add variables in enum for the title, description & subtitle
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color("appBlue"))
                    .ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                       
                        Divider()
                        
                        Text("Underweight")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI under 8:")
                            .foregroundColor(Color("appOrange"))
                        Text("People with a very low body fat percentage may fall into this category.")
                            .foregroundColor(Color("appOrange"))
                        
                        Divider()
                        
                        Text("Healthy Weightt")
                            .font(.title2)
                        Text("BAI between 8 and 21:")
                        Text("A BAI value in this range is usually considered a healthy body weight.")
                        
                        
                        Divider()
                        
                        Text("Overweight")
                            .font(.title2)
                        Text("BAI over 26:")
                        Text("A BAI value above 26 can indicate high body fat and is often considered a sign of obesity")
                        
                        Divider()
                        
                        Text("Obesity")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI between 21 and 26:")
                            .foregroundColor(Color("appOrange"))
                        Text("A higher BAI value may indicate a higher percentage of body fat, which is classified as overweight.")
                            .foregroundColor(Color("appOrange"))
                        
                        Divider()
                        
                        Text("Note")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("""
                         The BAI is just one of many metrics for assessing your health, and it may not provide a complete picture on its own. Always consult with a healthcare professional for a comprehensive evaluation of your health and body composition. Remember that maintaining a healthy lifestyle through proper diet and regular exercise is key to overall well-being.
                         
                         Enjoy using the App, and stay committed to a healthier you!
                         """)
                        .foregroundColor(Color("appOrange"))
                        
                        Divider()
                        
                    }
                    .foregroundColor(Color("appOrange"))
                    .padding()
                    
                    Spacer()
                }
                .navigationTitle("Meaning of my BAI")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    MeaningOfBaiNewView()
}
