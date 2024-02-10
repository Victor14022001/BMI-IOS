//
//  DietView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 21.01.24.
//

import SwiftUI
import Charts

struct DietView: View {
    @State private var showWaterSheet = false
    
    private var groceries = [
        (name: "Carbohydrates", count: 90),
        (name: "Vegetables", count: 90),
        (name: "Fats", count: 90),
        (name: "Protein", count: 90)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        Text("""
A balanced diet plays a crucial role in our health and well-being. The food we eat not only provides the energy we need for daily functioning, but also the nutrients necessary for numerous vital functions of our body.

A healthy diet should be rich in various nutrients, including proteins, carbohydrates, fats, vitamins and minerals. Fruits and vegetables are excellent sources of vitamins and fiber, which strengthen the immune system and aid digestion. Whole grains provide complex carbohydrates that provide long-term energy, while lean meats, fish, nuts and legumes provide important proteins and healthy fats.
""")
                        .foregroundStyle(Color("appOrange"))
                        VStack {
                            Chart {
                                ForEach(groceries, id: \.name) { element in
                                    SectorMark(
                                        angle: .value("item", element.count), angularInset: 2.0
                                    )
                                    .foregroundStyle(by: .value("Type", element.name))
                                    .annotation(position: .overlay) {
                                        Text("\(element.name)")
                                            .font(.system(size: 10))
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                            .frame(height: 200)
                            .padding(.vertical)
                        }

                        Text("""
It is important to ensure adequate hydration, preferably water. Water plays a key role in maintaining the body's water balance, regulating body temperature and supporting metabolic processes.

Avoiding excessive consumption of sugary drinks, high-fat foods and highly processed foods is an essential part of a healthy diet. A balanced diet not only helps prevent diseases such as cardiovascular disease, diabetes and obesity, but also promotes mental health and an overall sense of well-being.

To achieve the best results, it is advisable to adapt the diet to individual needs, lifestyle and physical activity. A balanced diet is therefore a crucial factor for a healthy and fulfilling life.
""")
                        .foregroundStyle(Color("appOrange"))
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("Diet")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Water", systemImage: "waterbottle") {
                        showWaterSheet = true
                    }
                }
            }
            .sheet(isPresented: $showWaterSheet) {
                WaterDrinkView(viewModel: BmiViewModel())
            }
        }
    }
}

#Preview {
    DietView()
}
