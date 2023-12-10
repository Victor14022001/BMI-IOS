//
//  MeaningOfBaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.12.23.
//

import SwiftUI

struct MeaningOfBaiNewView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color("appBlue"))
                    .ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)

                        Text("Underweight")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI under 8:")
                            .foregroundColor(Color("appOrange"))
                        Text("People with a very low body fat percentage may fall into this category.")
                            .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Underweight")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI under 8:")
                            .foregroundColor(Color("appOrange"))
                        Text("People with a very low body fat percentage may fall into this category.")
                            .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Overweight")
                            .font(.title)
                        Text("BMI between 25 - 29.9")
                        Text("A BMI between 25 and 29.9 indicates overweight. This increases the risk of health problems such as heart disease and type 2 diabetes.")
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Healthy Weightt")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI between 8 and 21:")
                            .foregroundColor(Color("appOrange"))
                        Text("A BAI value in this range is usually considered a healthy body weight.")
                            .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Overweight")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI over 26:")
                            .foregroundColor(Color("appOrange"))
                        Text("A BAI value above 26 can indicate high body fat and is often considered a sign of obesity")
                            .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Obesity")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("BAI between 21 and 26:")
                            .foregroundColor(Color("appOrange"))
                        Text("A higher BAI value may indicate a higher percentage of body fat, which is classified as overweight.")
                            .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Note")
                            .font(.title2)
                            .foregroundColor(Color("appOrange"))
                        Text("""
                         The BAI is just one of many metrics for assessing your health, and it may not provide a complete picture on its own. Always consult with a healthcare professional for a comprehensive evaluation of your health and body composition. Remember that maintaining a healthy lifestyle through proper diet and regular exercise is key to overall well-being.
                         
                         Enjoy using the App, and stay committed to a healthier you!
                         """)
                        .foregroundColor(Color("appOrange"))
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                        
                    }
                    .foregroundColor(Color("appOrange"))
                    .padding()
                    
                    Spacer()
                }
                .navigationTitle("Meaning of my BMI")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    MeaningOfBaiNewView()
}
