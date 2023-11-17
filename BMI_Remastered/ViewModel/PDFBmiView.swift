import SwiftUI
import PDFKit

struct ContentView: View {
    var body: some View {
        VStack {
            Button("PDF erstellen") {
                createPDF()
            }
        }
    }

    func createPDF() {
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

        // PDFView in einem UIViewController platzieren (optional)
        let pdfViewController = UIViewController()
        pdfViewController.view = pdfView

        // PDF-Datei in der Vorschau anzeigen (optional)
        UIApplication.shared.windows.first?.rootViewController?.present(pdfViewController, animated: true, completion: nil)
    }
}

#Preview {
    ContentView()
}

