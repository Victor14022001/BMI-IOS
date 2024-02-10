//
//  DiaryDetaiNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 10.12.23.
//

import SwiftUI

struct DiaryDetailNewView: View {
    var diary: DiaryData

    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                        Divider()
                    
                        Text(diary.title)
                            .font(.title)
                            .foregroundColor(Color("appOrange"))
                            .multilineTextAlignment(.leading)
                        
                        Divider()
                        
                        Text(diary.date.formatted(date: .complete, time: .omitted) )
                            .foregroundColor(Color("appOrange"))
                            .multilineTextAlignment(.leading)
                        
                        Text(diary.detail)
                            .foregroundColor(Color("appOrange"))
                            .multilineTextAlignment(.leading)
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
}
