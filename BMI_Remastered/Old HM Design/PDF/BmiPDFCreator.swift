//
//  PDFCreator.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import SwiftUI
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
        let appName = "HealthMetrics"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let appNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 28),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        let appNameRect = CGRect(x: 0, y: 40, width: 595, height: 40)
        (appName as NSString).draw(in: appNameRect, withAttributes: appNameAttributes)

        // Applogo links neben den Namen anzeigen
        let image = UIImage(named: "HealthMetricsAppLogo")
        let imageSize = CGSize(width: 100, height: 100)
        let imageOrigin = CGPoint(x: 10, y: 10)
        let imageRect = CGRect(origin: imageOrigin, size: imageSize)

        // Draw the image
        image?.draw(in: imageRect)

        // Tabellenüberschrift
        let tableWidth = 595 * 0.8
        let tableX = (595 - tableWidth) / 2
        let headerY = imageRect.maxY + 50
        let rowHeight: CGFloat = 20

        let headers = ["Index", "Date", "BMI"]
        let columnWidths = [0.2, 0.5, 0.3].map { $0 * tableWidth }

        // Tabellenkopf zeichnen
        for (index, header) in headers.enumerated() {
            let headerRect = CGRect(x: tableX + columnWidths.prefix(index).reduce(0, +), y: headerY, width: columnWidths[index], height: rowHeight)
            let headerAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            (header as NSString).draw(in: headerRect, withAttributes: headerAttributes)
        }

        // Zeichnen von Tabellenreihen
        let rowAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        
        for (index, data) in bmiDatas.enumerated() {
            let rowY = headerY + rowHeight + CGFloat(index) * rowHeight
            let rowData = [
                "\(index + 1)",
                data.date.formatted(date: .complete, time: .omitted),
                String(format: "%.2f", data.dataBmi)
            ]
            
            for (columnIndex, text) in rowData.enumerated() {
                let rowRect = CGRect(x: tableX + columnWidths.prefix(columnIndex).reduce(0, +), y: rowY, width: columnWidths[columnIndex], height: rowHeight)
                (text as NSString).draw(in: rowRect, withAttributes: rowAttributes)
            }
        }

        UIGraphicsEndPDFContext()

        // PDF-Daten an das PDFView-Objekt übergeben
        pdfView.document = PDFDocument(data: pdfData as Data)

        return pdfView
    }
}
