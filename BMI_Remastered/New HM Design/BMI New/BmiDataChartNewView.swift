//
//  BmiDataChartNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 03.12.23.
//

import SwiftUI
import SwiftData
import Charts

struct BmiDataChartNewView: View {
    @Query(sort: \BMIData.date) private var datas: [BMIData]
    @Environment(\.modelContext) var bmiContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    Chart {
                        ForEach(datas) { value in
                            LineMark(
                                x: .value("Index", value.date),
                                y: .value("Value", value.dataBmi)
                            )
                        }
                    }
                    .foregroundColor(Color("appOrange"))
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    Spacer()
                    
                    List {
                        ForEach(datas, id: \.self) { data in
                            VStack(alignment: .leading) {
                                Text("\(data.dataBmi)")
                                    .font(.headline)
                                    .foregroundStyle(Color("appOrange"))
                                
                                Text(data.date.formatted(date: .complete, time: .omitted))
                                    .foregroundStyle(Color("appOrange"))
                            }
                            .listRowBackground(Color("appBlue"))
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let deleteData = datas[index]
                                bmiContext.delete(deleteData)
                            }
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                }
                .padding()
                .navigationTitle("Bmi History Chart")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    BmiDataChartNewView()
}
