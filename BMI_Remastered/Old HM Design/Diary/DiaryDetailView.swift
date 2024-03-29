//
//  myDiaryDetailView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.11.23.
//

import SwiftUI
import SwiftData

struct DiaryDetailView: View {
    var diary: DiaryData

    var body: some View {
        List {
            Text(diary.title)
                .font(.title)

            Text(diary.date.formatted(date: .complete, time: .omitted))
                .font(.headline)

            Text(diary.detail)
        }
        .navigationTitle("\(diary.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
