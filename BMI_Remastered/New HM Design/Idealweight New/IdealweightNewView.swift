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
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    Text("The ideal weight is a term used to describe the weight that is considered healthy and appropriate for a specific individual based on various factors such as height, gender, age, body composition, and health condition. It's important to note that ideal weight is not solely focused on aesthetics but primarily on maintaining health and well-being.")
                        .foregroundColor(Color("appOrange"))
                        .padding(.bottom, 20)
                    
                   Divider()
                    
                    VStack {
                        HStack {
                            Text("Gender")
                                .foregroundColor(Color("appOrange"))
                            Spacer()
                            Text("\(viewModel.selectedGender)")
                                .foregroundColor(Color("appOrange"))
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Height")
                                .foregroundColor(Color("appOrange"))
                            Spacer()
                            Text("\(viewModel.bodyHeight) cm")
                                .foregroundColor(Color("appOrange"))
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Weight")
                                .foregroundColor(Color("appOrange"))
                            Spacer()
                            Text("\(viewModel.bodyWeight) kg")
                                .foregroundColor(Color("appOrange"))
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                    
                    VStack {
                        Text("Your IdealWeight:")
                            .foregroundColor(Color("appOrange"))
                            .font(.title)
                        Text("\(viewModel.yourIdealWeightString)")
                            .foregroundColor(Color("appOrange"))
                            .font(.title2)
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Idealweight")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    IdealweightNewView(viewModel: BmiViewModel())
}
