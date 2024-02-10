//
//  WaterDrinkView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 21.01.24.
//

import SwiftUI
import UserNotifications

struct WaterDrinkView: View {
    @State private var waterReminder = false
    @ObservedObject var viewModel: BmiViewModel
    
    @State private var showWaterSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Toggle("Water reminder", isOn: $viewModel.waterNotifications)
                            .onChange(of: viewModel.waterNotifications) {
                                viewModel.drinkWaterReminder()
                            }
                            .foregroundColor(Color("appOrange"))
                            .toggleStyle(SwitchToggleStyle(tint: Color("appOrange")))
                        
                        Text("""
In our busy and connected world, it's easy to overlook basic needs like proper water intake. Use an iPhone WaterDrinkReminder for health benefits, improved concentration, skin health, and weight management. Customizable push notifications make it effortless to stay hydrated without disrupting your routine. Integrate this simple yet effective method into your daily life for a healthier, well-hydrated future!
""")
                        .foregroundStyle(Color("appOrange"))
                        
                        Button("OG Water") {
                            showWaterSheet = true
                        }
                        .modifier(ButtonStyle())
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("Water")
            .preferredColorScheme(.dark)
            .onAppear {
                viewModel.drinkWaterReminder()
            }
            .sheet(isPresented: $showWaterSheet) {
                AddDrinkWAterView()
            }
        }
    }
}

#Preview {
    WaterDrinkView(viewModel: BmiViewModel())
}
