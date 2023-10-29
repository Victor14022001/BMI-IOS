//
//  BMIDataView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 30.09.23.
//

import SwiftUI
import SwiftData

struct BMIDataView: View {
    @Environment(\.modelContext) var context
    @Query private var datas: [BMIData]
    
    var body: some View {
        Form {
            ForEach(datas) { data in
                Text(data.bmi.description)
                Text(data.date.formatted(date: .short, time: .shortened))
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let deleteData = datas[index]
                    context.delete(deleteData)
                }
            }
        }
        .navigationTitle("Your saved BMI's")
    }
}

#Preview {
    BMIDataView()
}
