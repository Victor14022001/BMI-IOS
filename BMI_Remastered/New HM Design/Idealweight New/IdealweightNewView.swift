//
//  IdealweightNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 03.12.23.
//

import SwiftUI

struct IdealweightNewView: View {
    let viewModel: BmiViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    Text("The ideal weight is a term used to describe the weight that is considered healthy and appropriate for a specific individual based on various factors such as height, gender, age, body composition, and health condition. It's important to note that ideal weight is not solely focused on aesthetics but primarily on maintaining health and well-being.")
                        .foregroundColor(Color("appOrange"))
                        .padding(.bottom, 20)
                    
                    HStack {
                        VStack {
                            Text("Gender")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.selectedGender)")
                                .foregroundColor(Color("appOrange"))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Height")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.bodyHeight) cm")
                                .foregroundColor(Color("appOrange"))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Weight")
                                .foregroundColor(Color("appOrange"))
                            Text("\(viewModel.bodyWeight) kg")
                                .foregroundColor(Color("appOrange"))
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Your IdealWeight:")
                            .foregroundColor(Color("appOrange"))
                        
                        Spacer()
                        
                        Text("\(viewModel.yourIdealWeightString)")
                            .foregroundColor(Color("appOrange"))
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Idealweight")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    IdealweightNewView(viewModel: BmiViewModel())
}
