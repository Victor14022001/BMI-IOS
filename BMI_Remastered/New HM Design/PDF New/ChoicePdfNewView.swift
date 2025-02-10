//
//  ChaicePdfNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 11.12.23.
//

import SwiftUI
import SwiftData
import PDFKit

struct ChoicePdfNewView: View {
    @Query(sort: \BMIData.date) private var bmiDatas: [BMIData]
    @Query(sort: \BAIData.date) private var baiDatas: [BAIData]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack(spacing: 20) {
                    Button {
                        showBmiPDF()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                        Text("Export BMI to PDF")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .modifier(ButtonStyle())
                    
                    Button {
                        showBaiPDF()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                        Text("Export BAI to PDF")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .modifier(ButtonStyle())
                    
                    Spacer()
                }
                .padding()
            }
            .accentColor(Color("appOrange"))
            .navigationTitle("Export to PDF")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }

    func showBmiPDF() {
        let pdfView = BmiPDFCreator.createPDF(bmiDatas: bmiDatas)
        
        // PDFView in einem UIViewController platzieren (optional)
        let pdfViewController = UIViewController()
        pdfViewController.view = pdfView
        
        // PDF-Datei in der Vorschau anzeigen (optional)
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(pdfViewController, animated: true, completion: nil)
        }
    }
     
    func showBaiPDF() {
        let pdfView = BaiPDFCreator.createPDF(baiDatas: baiDatas)
        
        // PDFView in einem UIViewController platzieren (optional)
        let pdfViewController = UIViewController()
        pdfViewController.view = pdfView
        
        // PDF-Datei in der Vorschau anzeigen (optional)
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(pdfViewController, animated: true, completion: nil)
        }
    }
}

#Preview {
    ChoicePdfNewView()
}
