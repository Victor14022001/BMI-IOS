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
                    ScrollView {
                        Text("The ideal weight is a term used to describe the weight that is considered healthy and appropriate for a specific individual based on various factors such as height, gender, age, body composition, and health condition. It's important to note that ideal weight is not solely focused on aesthetics but primarily on maintaining health and well-being.")
                            .modifier(BodyTextStyle())
                        
                            .padding(.bottom, 20)
                        
                        Divider()
                        
                        VStack {
                            HStack {
                                Text("Gender")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text("\(viewModel.storedGender)")
                                    .foregroundColor(Color("appOrange"))
                            }
//                            .padding(.bottom, 10)
                            
                            HStack {
                                Text("Age")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text("\(String(viewModel.storedAge)) years")
                                    .foregroundColor(Color("appOrange"))
                            }
//                            .padding(.bottom, 10)
                            
                            HStack {
                                Text("Height")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text("\(viewModel.storedBodyHeight) cm")
                                    .foregroundColor(Color("appOrange"))
                            }
//                            .padding(.bottom, 10)
                            
                            HStack {
                                Text("Weight")
                                    .foregroundColor(Color("appOrange"))
                                Spacer()
                                Text(viewModel.bodyWeight + " kg")
                                    .foregroundColor(Color("appOrange"))
                            }
//                            .padding(.bottom, 10)
                        }
//                        .padding(.bottom, 20)
                        
                        Divider()
                        
                        VStack {
                            Text("Your IdealWeight:")
                                .foregroundColor(Color("appOrange"))
                                .font(.title)
                            Text("\(viewModel.calculatedIdealwieghtString)")
                                .foregroundColor(Color("appOrange"))
                                .font(.title2)
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .padding()
                }
               .scrollBounceBehavior(.basedOnSize)
            }
            .navigationTitle("Idealweight")
            .preferredColorScheme(.dark)
        }
        .onAppear(perform: viewModel.calculateIdealWeight)
    }
}

#Preview {
    IdealweightNewView(viewModel: BmiViewModel())
}
