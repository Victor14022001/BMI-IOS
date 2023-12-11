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
                    Text(diary.title)
                    .font(.title)
                    .foregroundColor(Color("appOrange"))
                    
                    Text(diary.date.formatted(date: .complete, time: .omitted))
                    .font(.headline)
                    .foregroundColor(Color("appOrange"))
                    
                    Text(diary.detail)
                    .foregroundColor(Color("appOrange"))
                    
                  Spacer()
                }
                .padding()
                .accentColor(Color("appOrange"))
                .navigationTitle("\(diary.title)")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
