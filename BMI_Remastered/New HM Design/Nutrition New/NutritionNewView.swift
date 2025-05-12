//
//  FruitsNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 20.05.24.
//

import SwiftUI

// MARK: - Nutrition
struct Nutrition: Codable, Identifiable {
    let id = UUID()
    let name: String
    let calories, servingSizeG, fatTotalG, fatSaturatedG, proteinG, sodiumMg, potassiumMg, cholesterolMg, carbohydratesTotalG, fiberG, sugarG: Double
    
    enum CodingKeys: String, CodingKey {
        case name, calories
        case servingSizeG = "serving_size_g"
        case fatTotalG = "fat_total_g"
        case fatSaturatedG = "fat_saturated_g"
        case proteinG = "protein_g"
        case sodiumMg = "sodium_mg"
        case potassiumMg = "potassium_mg"
        case cholesterolMg = "cholesterol_mg"
        case carbohydratesTotalG = "carbohydrates_total_g"
        case fiberG = "fiber_g"
        case sugarG = "sugar_g"
    }
}

struct NutritionNewView: View {
    @State private var fruit: String = ""
    @State private var item = [Nutrition]()
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        TextField("Enter your e.g. Fruit you looking for", text: $fruit)
                            .modifier(TextFieldStyle())
                            .padding()
                        
                        Button {
                            Task {
                                await loadData()
                            }
                        } label: {
                            Text("Fetch Nutrition Info")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .modifier(ButtonStyle())
                                  
                        if isLoading {
                            ProgressView()
                                .padding()
                        }
                        
                        ForEach(item) { fruit in
                            VStack {
                                Text(fruit.name.capitalized)
                                    .font(.title)
                                    .foregroundColor(Color("appOrange"))
                                
                                HStack {
                                    Text("Calories:")
                                    Spacer()
                                    Text("\(fruit.calories, specifier: "%.2f")")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Serving Size:")
                                    Spacer()
                                    Text("\(fruit.servingSizeG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Fat:")
                                    Spacer()
                                    Text("\(fruit.fatTotalG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Saturated Fat:")
                                    Spacer()
                                    Text("\(fruit.fatSaturatedG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Protein:")
                                    Spacer()
                                    Text("\(fruit.proteinG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Sodium:")
                                    Spacer()
                                    Text("\(fruit.sodiumMg, specifier: "%.2f") mg")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Potassium:")
                                    Spacer()
                                    Text("\(fruit.potassiumMg, specifier: "%.2f") mg")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Cholesterol:")
                                    Spacer()
                                    Text("\(fruit.cholesterolMg, specifier: "%.2f") mg")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Carbohydrates:")
                                    Spacer()
                                    Text("\(fruit.carbohydratesTotalG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Fiber:")
                                    Spacer()
                                    Text("\(fruit.fiberG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("Sugar:")
                                    Spacer()
                                    Text(" \(fruit.sugarG, specifier: "%.2f") g")
                                }
                                .foregroundColor(Color("appOrange"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .padding(.top)
                            
                            Divider()
                        }
                    }
                    .padding()
                }
                .scrollBounceBehavior(.basedOnSize)
            }
            .navigationTitle("Nutrition")
        }
    }
    
    func loadData() async {
        guard let fruitUrl = URL(string: "https://api.api-ninjas.com/v1/nutrition?query=\(fruit)") else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        var request = URLRequest(url: fruitUrl)
        request.setValue("afhvRBX4iK0hptyuHBruRs7wL7PqaOPiyc9f0jHn", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON Response: \(jsonString)")
                }
                if let decodedResponse = try? JSONDecoder().decode([Nutrition].self, from: data) {
                    item = decodedResponse
                } else {
                    print("Failed to decode response")
                }
            } else {
                print("HTTP Error: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
            }
        } catch {
            print("Data fetch error: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}

#Preview {
    NutritionNewView()
}
