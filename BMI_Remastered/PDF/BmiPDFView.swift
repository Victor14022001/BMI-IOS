//
//  PDFBmiView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import SwiftUI
import SwiftData
import PDFKit

struct BmiPDFView: View {
    @Query(sort: \BMIData.date) private var datas: [BMIData]

    var body: some View {
        VStack {
            Button("PDF erstellen") {
                showPDF()
            }
        }
    }

    func showPDF() {
        let pdfView = BmiPDFCreator.createPDF(datas: datas)

    // PDFView in einem UIViewController platzieren (optional)
    let pdfViewController = UIViewController()
    pdfViewController.view = pdfView

    // PDF-Datei in der Vorschau anzeigen (optional)
    UIApplication.shared.windows.first?.rootViewController?.present(pdfViewController, animated: true, completion: nil)
}
}

#Preview {
    BmiPDFView()
}
