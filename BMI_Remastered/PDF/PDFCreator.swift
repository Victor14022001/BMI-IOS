//
//  PDFCreator.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 17.11.23.
//

import Foundation
import PDFKit
import UIKit

class PDFCreator {
    static func createPDF() -> PDFView {
        let pdfView = PDFView()

        // Erstellen Sie eine PDF-Datei mit dem gewünschten Inhalt
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 200, height: 200), nil)
        UIGraphicsBeginPDFPage()
        let text = "Hallo, dies ist ein einfaches PDF-Dokument erstellt mit SwiftUI und PDFKit."
        (text as NSString).draw(at: CGPoint(x: 10, y: 10), withAttributes: nil)
        UIGraphicsEndPDFContext()

        // PDF-Daten an das PDFView-Objekt übergeben
        pdfView.document = PDFDocument(data: pdfData as Data)

        return pdfView
    }
}
