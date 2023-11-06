//
//  MaiDataChartView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.11.23.
//

import SwiftUI
import SwiftData
import Charts

struct BaiDataChartView: View {
    @Environment(\.modelContext) var baiContext
    @Query private var datas: [BAIData]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(datas) { data in
                    LineMark(
                        x: .value("Date", data.date),
                        y: .value("BAI", data.bai)
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            Spacer()
            
            List {
                ForEach(datas) { data in
                    VStack(alignment: .leading) {
                        Text("\(data.bai)")
                            .font(.headline)
                        
                        Text(data.date.formatted(date: .complete, time: .omitted))
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let deleteData = datas[index]
                        baiContext.delete(deleteData)
                    }
                }
            }
            .navigationTitle("Bai's History Chart")
        }
    }
}

#Preview {
    BaiDataChartView()
}
