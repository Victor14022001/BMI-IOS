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
    @Query var datas: [Diary]
    @Environment(\.modelContext) var diaryContext
    @State private var showDetailSheet = false
    var diaryDtails: Diary?
    
    var sortedDatas: [Diary] {
            return datas.sorted(by: { $0.date > $1.date })
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack {
                    List {
                        ForEach(sortedDatas) { data in
                            NavigationLink {
                               DiaryDetailNewView(diary: data)
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
                    .accentColor(Color("appOrange"))
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Your Diary's")
                    .navigationBarTitleDisplayMode(.inline)
                    .preferredColorScheme(.dark)
                }
            }
        }
    }
}

#Preview {
    DiaryDataNewView()
}

