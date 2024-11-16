import SwiftUI
import SwiftData

struct AddDrinkWAterView: View {
    @Query var waterData: [WaterData]
    @Environment(\.modelContext) var waterContext
    
    @State private var percent: Double = 40.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach([100, 250, 500, 1000, 1500, 2000], id: \.self) { amount in
                                VStack {
                                    Image(systemName: "drop.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(Color("appBlue"))
                                    Text("\(amount / 1000 > 0 ? "\(amount / 1000) L" : "\(amount) ml")")
                                        .font(.headline)
                                }
                                .modifier(CapacitiyPicker())
                                .onTapGesture {
                                    let water = WaterData(drankWater: amount)
                                    waterContext.insert(water)
                                }
                            }
                        }
                        .padding(.top)
                    }
                    
                    ScrollView {
                        VStack {
                            if waterData.isEmpty {
                                VStack {
                                    Text("No data available")
                                        .font(.title)
                                        .foregroundColor(Color("appOrange"))
                                    CircleWaveView(percent: 0)
                                    Text("Total: 0 ml")
                                        .foregroundColor(Color("appOrange"))
                                        .padding(.top)
                                }
                                .padding(.vertical)
                            } else {
                                ForEach(aggregateWaterDataByDate(), id: \.0) { date, totalWater in
                                    VStack {
                                        Text("Date: \(dateString(from: date))")
                                            .font(.title)
                                            .foregroundColor(Color("appOrange"))
                                        CircleWaveView(percent: min(100, totalWater * 100 / 2000)) // Display as percentage of 2000 ml
                                        Text("Total: \(totalWater) ml")
                                            .foregroundColor(Color("appOrange"))
                                            .padding(.top)
                                    }
                                    .padding(.vertical)
                                }
                            }
                        }
                        .padding()
                    }
                    .scrollBounceBehavior(.basedOnSize)
                }
                .background(Color("appBlue")) // Ensure background color covers all
            }
            .navigationTitle("Add drink WAter")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
    
    func aggregateWaterDataByDate() -> [(Date, Int)] {
        let calendar = Calendar.current
        var groupedData: [Date: Int] = [:]
        
        for water in waterData {
            let startOfDay = calendar.startOfDay(for: water.drankWaterDate)
            groupedData[startOfDay, default: 0] += water.drankWater
        }
        
        return groupedData.sorted(by: { $0.key < $1.key })
    }
    
    func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    AddDrinkWAterView()
}
