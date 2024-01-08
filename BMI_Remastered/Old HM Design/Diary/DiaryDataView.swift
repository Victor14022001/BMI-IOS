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
    @State private var showDetailSheet = false
    var diaryDtails: Diary? // value misspelling

    var body: some View {
        List {
            ForEach(datas) { data in
                Button {
                    diaryDtails = data
                    showDetailSheet = true
                } label: {
                    VStack(alignment: .leading) {
                        Text("\(data.title)")
                            .font(.headline)
                            .foregroundColor(Color("appOrange"))

                        Text(data.date.formatted(date: .complete, time: .omitted))
                            .foregroundColor(Color("appOrange"))
                    }
                }
                .listRowBackground(Color("appBlue"))
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
        .sheet(isPresented: $showDetailSheet) {
            DiaryDetailView(diary: diaryDtails!)
        }
    }
}

#Preview {
    DiaryDataView()
}
