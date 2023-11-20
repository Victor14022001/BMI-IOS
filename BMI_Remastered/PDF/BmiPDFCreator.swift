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
        
        // Applogo links neben den Namen anzeigen...
        let image = UIImage(named: "HealthMetricsAppLogo")
        let imageSize = CGSize(width: 100, height: 100)
        let imageX = (pdfView.bounds.width - imageSize.width) / 2
        let imageY = (pdfView.bounds.height - imageSize.height) / 2
        let imageOrigin = CGPoint(x: imageX, y: imageY)
        let imageRect = CGRect(origin: imageOrigin, size: imageSize)
        image!.draw(in: imageRect)
        
        // Daten aus der Datenbank anzeigen
        let dataText = "Daten aus der Datenbank:"
        let dataTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        let dataTextRect = CGRect(x: 10, y: imageRect.maxY + 20, width: 400, height: 20)
        (dataText as NSString).draw(in: dataTextRect, withAttributes: dataTextAttributes)
        
        // BMI aus [BMIData] anzeigen...
        for (index, data) in self.datas.enumerated() {
            let dataString = "\(index + 1). \(data.date) - BMI: \(data.bmi)"
            let dataAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            let dataRect = CGRect(x: 10, y: dataTextRect.maxY + CGFloat(index * 20), width: 400, height: 20)
            (dataString as NSString).draw(in: dataRect, withAttributes: dataAttributes)
        }
        
        UIGraphicsEndPDFContext()
        
        // PDF-Daten an das PDFView-Objekt übergeben
        pdfView.document = PDFDocument(data: pdfData as Data)
        
        return pdfView
    }
}
