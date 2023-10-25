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
    @Environment(\.modelContext) var context
    @Query private var datas: [BMIData]
    
    var body: some View {
        Text("Hallo")
    }
}


#Preview {
    BmiDataChartView()
        .previewInterfaceOrientation(.landscapeLeft)
}
