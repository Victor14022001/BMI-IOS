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

    static func createPDF(bmiDatas: [BMIData]) -> PDFView {
        let pdfView = PDFView()

        // Erstellen Sie eine PDF-Datei mit dem gewünschten Inhalt
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 595, height: 842), nil)
        UIGraphicsBeginPDFPage()

        // HealthMetrics als Namen zentrieren
        let appName = "HeathMetrics"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let appNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        let appNameRect = CGRect(x: 10, y: 30, width: 400, height: 40)
        (appName as NSString).draw(in: appNameRect, withAttributes: appNameAttributes)

        // Applogo links neben den Namen anzeigen
        let image = UIImage(named: "HealthMetricsAppLogo")
        let imageSize = CGSize(width: 100, height: 100)

        // Zentriere das Bild im pdfView
        let imageX = (pdfView.bounds.width - imageSize.width) / 2
        let imageY = (pdfView.bounds.height - imageSize.height) / 2

        // Stelle sicher, dass das Bild nicht über den Rand des pdfView hinausragt
        let imageXAdjusted = max(0, imageX)
        let imageYAdjusted = max(0, imageY)

        let imageOrigin = CGPoint(x: imageXAdjusted, y: imageYAdjusted)
        let imageRect = CGRect(origin: imageOrigin, size: imageSize)

        // Draw the image
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

        // BMI aus [BMIData] anzeigen
        // MARK: - Muss gelöscht werden, wird nicht gebraucht.
        for (index, data) in bmiDatas.enumerated() {
            let dataString = "\(index + 1). \(data.date.formatted(date: .complete, time: .omitted)) - BMI: \(data.dataBmi)"
            let dataAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 0),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            let dataRect = CGRect(x: 10, y: dataTextRect.maxY + CGFloat(index * 20), width: 400, height: 20)
            (dataString as NSString).draw(in: dataRect, withAttributes: dataAttributes)
        }

        // Tabellenüberschrift
        let headerAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        let headerRect = CGRect(x: 10, y: dataTextRect.maxY + 50, width: 400, height: 20)
        ("Idx      Date                             BMI" as NSString).draw(in: headerRect, withAttributes: headerAttributes)

        // Zeichnen von Tabellenreihen
        for (index, data) in bmiDatas.enumerated() {
            let rowString = String(format: "%-7d %@  %.2f", index + 1, data.date.formatted(date: .complete, time: .omitted), data.dataBmi)
            let rowAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            let rowRect = CGRect(x: 10, y: headerRect.maxY + CGFloat(index * 20), width: 400, height: 20)
            (rowString as NSString).draw(in: rowRect, withAttributes: rowAttributes)
        }

        UIGraphicsEndPDFContext()

        // PDF-Daten an das PDFView-Objekt übergeben
        pdfView.document = PDFDocument(data: pdfData as Data)

        return pdfView
    }
}
