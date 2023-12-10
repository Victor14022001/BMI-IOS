//
//  MeaningOfBmiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 03.12.23.
//

import SwiftUI

struct MeaningOfBmiNewView: View {
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

                        Text("Underwieght")
                            .font(.title)
                        Text("BMI under < 18.5")
                        Text("People with a BMI below 18.5 are considered underweight. This may indicate malnutrition or other health problems.")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Normalwieght")
                            .font(.title)
                        Text("BMI between 18.5 - 24.0")
                        Text("A BMI between 18.5 and 24.9 is considered normal weight. This is the range that many consider a healthy weight.")
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
                        
                        Text("Obesity grade I")
                            .font(.title)
                        Text("BMI between 30 - 34.9")
                        Text("A BMI of 30 to 34.9 is considered mildly overweight or grade I obesity.")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Obesity grade II")
                            .font(.title)
                        Text("BMI between 35 - 39.9")
                        Text("A BMI of 35 to 39.9 is considered moderate obesity or grade II obesity.")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Obesity grade III")
                            .font(.title)
                        Text("BMI > 40")
                        Text("A BMI of 40 or higher is called severe obesity or grade III obesity.")
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightbackground)
                            .padding(.bottom, 10)
                        
                        Text("Note")
                            .font(.title)
                        Text("It is important to note that BMI is only a rough method of assessing body weight and does not take into account all relevant factors, such as muscle mass, body composition, age and gender differences. Therefore, BMI should be used in conjunction with other health factors and medical judgment to provide a more comprehensive assessment of health status.")
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
    MeaningOfBmiNewView()
}
