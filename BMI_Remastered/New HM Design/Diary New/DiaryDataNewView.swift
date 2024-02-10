//
//  DiaryDataNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 07.12.23.
//

import SwiftUI
import SwiftData
import Charts

struct DiaryDataNewView: View {
    @Query var datas: [DiaryData]
    @Environment(\.modelContext) var diaryContext
    @State private var showDetailSheet = false
    var diaryDtails: DiaryData?
    
    var sortedDatas: [DiaryData] {
            return datas.sorted(by: { $0.date > $1.date })
        }
    
    @State private var searchText: String = ""
    
    var filteredDatas: [DiaryData] {
            if searchText.isEmpty {
                return datas.sorted(by: { $0.date > $1.date })
            } else {
                return datas.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    List {
                        ForEach(filteredDatas) { data in
                            NavigationLink {
                               DiaryDetailNewView(diary: data)
                                    .accentColor(Color("appOrange"))
                            } label: {
                                VStack(alignment: .leading) {
                                    Divider()
                                    Text("\(data.title)")
                                        .font(.headline)
                                        .foregroundColor(Color("appOrange"))
                                    
                                    Text(data.date.formatted(date: .complete, time: .omitted))
                                        .foregroundColor(Color("appOrange"))
                                    Divider()
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
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Your Diary's")
                    .navigationBarTitleDisplayMode(.inline)
                    .preferredColorScheme(.dark)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Look through yozr Diarys...")
    }
}

#Preview {
    DiaryDataNewView()
}

