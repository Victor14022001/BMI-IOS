//
//  DiaryNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 06.12.23.
//

import SwiftUI

struct DiaryNewView: View {
    @Environment(\.modelContext) var diaryContext
    
    @State private var title: String = ""
    @State private var detail: String = ""
    let lineHeight: CGFloat = 330
    
    @State private var showMeaningBaiSheet = false
    @FocusState var diaryEntryField: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        TextField("Enter your Title", text: $title)
                            .keyboardType(.default)
                            .focused($diaryEntryField)
                            .modifier(TextFieldStyle())
                        
                        TextField("text here...", text: $detail, axis: .vertical)
                            .keyboardType(.default)
                            .focused($diaryEntryField)
                            .modifier(TextFieldStyle())
                        
                        Button {
                            let diary = DiaryData(title: title, detail: detail, date: .now)
                            diaryContext.insert(diary)
                        } label: {
                            Text("Done")
                        }
                        .modifier(ButtonStyle())
                        
                        Button {
                            showMeaningBaiSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "bookmark")
                                Text("Show my Diaries")
                            }
                        }
                        .modifier(ButtonStyle())
                    }
                    .padding()
                    //  Spacer()
                }
                .sheet(isPresented: $showMeaningBaiSheet) {
                    DiaryDataNewView()
                }
                .accentColor(Color("appOrange"))
                .navigationTitle("Today's Diary: \(title)")
                // .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            diaryEntryField = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DiaryNewView()
}
