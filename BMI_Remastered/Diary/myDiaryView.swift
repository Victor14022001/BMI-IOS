//
//  myDiaryView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 04.11.23.
//

import SwiftUI
import SwiftData

struct myDiaryView: View {
    @Environment(\.modelContext) var context
    @Query private var datas: [BMIData]
    
    @State private var hallo: String
    
    var body: some View {
        Form {
            TextField("Enter text", text: $hallo, axis: .vertical)
            
        }
    }
}

#Preview {
    myDiaryView()
}
