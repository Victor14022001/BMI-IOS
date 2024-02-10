//
//  myDiaryView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.11.23.
//

import SwiftUI
import SwiftData

struct DiaryView: View {
    @Environment(\.modelContext) var diaryContext

    @State private var title: String = ""
    @State private var detail: String = ""
    let lineHeight: CGFloat = 330

    var body: some View {
        NavigationView {
            Form {
                Section("Enter todays title") {
                    TextField("", text: $title)
                }

                Section("Enter todays Diary") {
                    TextEditor(text: $detail)
                        .padding()
                        .frame(height: lineHeight)
                }
                Section {
                    Button {
                        let diary = DiaryData(title: title, detail: detail, date: .now)
                        diaryContext.insert(diary)
                    } label: {
                        Text("Done")
                    }
                }

                Section {
                    NavigationLink {
                        DiaryDataView()
                    } label: {
                        HStack {
                            Image(systemName: "bookmark")
                            Text("Show my Diaries")
                        }
                    }
                }
                .navigationTitle("Today's Diary: \(title)")
            }
        }
    }
}

#Preview {
    DiaryView()
}
