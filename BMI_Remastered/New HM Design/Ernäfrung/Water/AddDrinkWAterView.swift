//
//  AddDrinkWAterView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 25.01.24.
//

import SwiftUI
import SwiftData

struct AddDrinkWAterView: View {
    @Query var waterData: [WaterData]
    @Environment(\.modelContext) var waterContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Empty VStack")
                        
                        ForEach(waterData) { water in
                            Text("\(water.drankWater)")
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("100 ml")
                                    .font(.headline)
                                
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 100)
                                waterContext.insert(water)
                            }
                            
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("250 ml")
                                    .font(.headline)
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 250)
                                waterContext.insert(water)
                            }
                            
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("500 ml")
                                    .font(.headline)
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 500)
                                waterContext.insert(water)
                            }
                            
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("1 L")
                                    .font(.headline)
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 1000)
                                waterContext.insert(water)
                            }
                            
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("1,5 L")
                                    .font(.headline)
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 1500)
                                waterContext.insert(water)
                            }
                            
                            VStack {
                                Image(systemName: "drop.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("appBlue"))
                                Text("2 L")
                                    .font(.headline)
                            }
                            .modifier(CapacitiyPicker())
                            .onTapGesture {
                                let water = WaterData(drankWater: 2000)
                                waterContext.insert(water)
                            }
                        }
                    }
                    VStack {
                      // WaterCircleWaveView(percent: 40)
                        //Slider(value: self.$wavePercent, in: 1...100)
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Add drink WAter")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
}


#Preview {
    AddDrinkWAterView()
}
