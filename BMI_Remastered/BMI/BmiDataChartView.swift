//
//  BmiDataChartView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 30.09.23.
//

import SwiftUI
import Charts
import SwiftData

struct BmiDataChartView: View {
    @Environment(\.modelContext) var context // TODO: Ungenutzte Variable, kann weg!
    @Query private var datas: [BMIData]

    var body: some View {
        VStack {
            Chart {
                ForEach(datas) { value in
                    LineMark(
                        x: .value("Index", value.date),
                        y: .value("Value", value.bmi)
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)

            Spacer()

            List {
                ForEach(datas) { data in
                    VStack(alignment: .leading) {
                        Text("\(data.bmi)")
                            .font(.headline)

                        Text(data.date.formatted(date: .complete, time: .omitted))
                    }
                }
            }
            .navigationTitle("BMI History")
        }
    }
}



    #Preview {
        BmiDataChartView()
    }
