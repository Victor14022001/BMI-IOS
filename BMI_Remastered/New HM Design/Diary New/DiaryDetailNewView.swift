//
//  DiaryDetaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 10.12.23.
//

import SwiftUI

struct DiaryDetailNewView: View {
    var diary: Diary

    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading, spacing: 20) {
                    
                    Divider()
                    Text(diary.title)
                        .font(.title)
                        .foregroundColor(Color("appOrange"))
                    
                    Divider()
                    
                    Text(diary.date.formatted(date: .complete, time: .omitted))
                        .foregroundColor(Color("appOrange"))
                    
                    Text(diary.detail)
                        .foregroundColor(Color("appOrange"))
                    Divider()
                    Spacer()
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .padding()
                .accentColor(Color("appOrange"))
                .navigationTitle("\(diary.title)")
                .foregroundColor(Color("appOrange"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
