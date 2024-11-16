//
//  BaiDataChartNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.12.23.
//

import SwiftUI
import Charts
import SwiftData

struct BaiDataChartNewView: View {
    @Query(sort: \BAIData.date) private var datas: [BAIData]
    @Environment(\.modelContext) var baiContext

    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    Chart {
                        ForEach(datas) { data in
                            LineMark(
                                x: .value("Date", data.date),
                                y: .value("BAI", data.dataBai)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .foregroundColor(Color("appOrange"))
                    
                    Spacer()
                    
                    List {
                        ForEach(datas) { data in
                            VStack(alignment: .leading) {
                                Text("\(data.dataBai)")
                                    .font(.headline)
                                    .foregroundColor(Color("appOrange"))
                                
                                Text(data.date.formatted(date: .complete, time: .omitted))
                                    .foregroundColor(Color("appOrange"))
                            }
                            .listRowBackground(Color("appBlue"))
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let deleteData = datas[index]
                                baiContext.delete(deleteData)
                            }
                        }
                    }
                    .scrollBounceBehavior(.basedOnSize)
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Bai's History Chart")
                    .navigationBarTitleDisplayMode(.inline)
                    .preferredColorScheme(.dark)
                }
            }
        }
    }
}

#Preview {
    BaiDataChartNewView()
}
