//
//  TestView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import SwiftUI

struct ChoicePDFView: View {
    var body: some View {
        Form {
            NavigationLink {
                BmiPDFView()
                    .onAppear(perform: BmiPDFView().showPDF)
            } label: {
                Text("Export BMI to PDF")
            }
            .navigationTitle("Export to PDF")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ChoicePDFView()
}
