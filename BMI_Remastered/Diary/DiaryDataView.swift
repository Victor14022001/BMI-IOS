//
//  myDiaryDataView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.11.23.
//

import SwiftUI
import SwiftData

struct DiaryDataView: View {
    @Query var datas: [Diary]
    @Environment(\.modelContext) var diaryContext

    var body: some View {
        List {
            ForEach(datas) { data in
                NavigationLink {
                    DiaryDetailView(diary: data)
                } label: {
                    VStack(alignment: .leading) {
                        Text("\(data.title)")
                            .font(.headline)

                        Text(data.date.formatted(date: .complete, time: .omitted))
                    }
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let deleteData = datas[index]
                    diaryContext.delete(deleteData)
                }
            }
        }
        .navigationTitle("Your Diary's")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DiaryDataView()
}
