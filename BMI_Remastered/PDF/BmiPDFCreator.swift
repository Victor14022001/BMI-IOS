//
//  PDFCreator.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import SwiftUI
import SwiftData
import PDFKit
import UIKit

class BmiPDFCreator {
    @Query(sort: \BMIData.date) private var datas: [BMIData]

    static func createPDF() -> PDFView {
        let pdfView = PDFView()

        // Erstellen Sie eine PDF-Datei mit dem gewünschten Inhalt
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 200, height: 200), nil)
        UIGraphicsBeginPDFPage()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 595, height: 842), nil)
        UIGraphicsBeginPDFPage()

        // HealthMetrics als Namen zentrieren...
        let appName = "HeathMetrics"
        let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
        let appNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
        ]
        let appNameRect = CGRect(x: 10, y: 10, width: 400, height: 40)
        (appName as NSString).draw(in: appNameRect, withAttributes: appNameAttributes)

        let text = ""
        (text as NSString).draw(at: CGPoint(x: 10, y: 10), withAttributes: nil)
        UIGraphicsEndPDFContext()

        // PDF-Daten an das PDFView-Objekt übergeben
        pdfView.document = PDFDocument(data: pdfData as Data)

        return pdfView
    }
}
