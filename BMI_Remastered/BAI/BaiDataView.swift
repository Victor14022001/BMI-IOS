//
//  BaiDataView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.11.23.
//

import SwiftUI
import SwiftData

struct BaiDataView: View {
    @Environment(\.modelContext) var baiContext
    @Query private var datas: [BAIData]
    
    var body: some View {
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
    }
}

#Preview {
    BaiDataView()
}
