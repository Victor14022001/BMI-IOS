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
        }
        .navigationTitle("Export to PDF")
        .navigationBarTitleDisplayMode(.inline)
    }

    func showBmiPDF() {
        presentPDFView(pdfView: BmiPDFCreator.createPDF(bmiDatas: bmiDatas))
    }

    func showBaiPDF() {
        presentPDFView(pdfView: BaiPDFCreator.createPDF(baiDatas: baiDatas))
    }

    private func presentPDFView(pdfView: UIView) {
        // Sucht die oberste Fenster-Szene
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            let pdfViewController = UIViewController()
            pdfViewController.view = pdfView

            rootViewController.present(pdfViewController, animated: true, completion: nil)
        }
    }
}

#Preview {
    ChoicePDFView()
}
