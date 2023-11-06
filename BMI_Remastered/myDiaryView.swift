//
//  myDiaryView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.11.23.
//

import SwiftUI
import SwiftData

struct myDiaryView: View {
    @Environment(\.modelContext) var diaryContext
    @Query private var datas: [Diary]
    
    @State private var title: String = ""
    @State private var detail: String = ""
    
    let lineHeight: CGFloat = 22
    
    var body: some View {
        NavigationView {
            Form {
                Section("Enter todays title") {
                    TextField("", text: $title)
                }
                
                Section("Enter todays Diary") {
                    TextEditor(text: $detail)
                        .padding()
                        .frame(height: lineHeight * 15)
                }
                
                Section {
                    Button {
                        let diary = Diary(title: title, detail: detail, date: .now)
                        diaryContext.insert(diary)
                    } label: {
                        Text("Done")
                    }
                }
                
                Section {
                    NavigationLink {
                        myDiaryDataView()
                    } label: {
                        Text("Show my Diaries")
                    }
                }
                .navigationTitle("Today's Diary: \(title)")
            }
        }
    }
}

#Preview {
    myDiaryView()
}
