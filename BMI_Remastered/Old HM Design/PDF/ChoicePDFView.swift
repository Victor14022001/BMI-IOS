//
//  TestView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import SwiftUI
import SwiftData

struct ChoicePDFView: View {
    @Query(sort: \BMIData.date) private var bmiDatas: [BMIData]
    @Query(sort: \BAIData.date) private var baiDatas: [BAIData]

    var body: some View {
        Form {
            Section {
                Button {
                    showBmiPDF()
                } label: {
                    Text("Export BMI to PDF")
                }
            }

            Section {
                Button {
                   showBaiPDF()
                } label: {
                    Text("Export BAI to PDF")
                }
            }
            .navigationTitle("Export to PDF")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func showBmiPDF() {
        let pdfView = BmiPDFCreator.createPDF(bmiDatas: bmiDatas)

    // PDFView in einem UIViewController platzieren (optional)
    let pdfViewController = UIViewController()
    pdfViewController.view = pdfView

    // PDF-Datei in der Vorschau anzeigen (optional)
    UIApplication.shared.windows.first?.rootViewController?.present(pdfViewController, animated: true, completion: nil)
}

    func showBaiPDF() {
        let pdfView = BaiPDFCreator.createPDF(baiDatas: baiDatas)

    // PDFView in einem UIViewController platzieren (optional)
    let pdfViewController = UIViewController()
    pdfViewController.view = pdfView

    // PDF-Datei in der Vorschau anzeigen (optional)
    UIApplication.shared.windows.first?.rootViewController?.present(pdfViewController, animated: true, completion: nil)
}
}

#Preview {
    ChoicePDFView()
}
