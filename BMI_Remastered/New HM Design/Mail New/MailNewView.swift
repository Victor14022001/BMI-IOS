//
//  MailNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 11.12.23.
//

import SwiftUI
import MessageUI
import UIKit

struct MailNewView: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            
            switch result {
            case .cancelled:
                print("E-Mail wurde abgebrochen")
            case .saved:
                print("E-Mail wurde gespeichert, aber nicht versendet")
            case .sent:
                print("E-Mail wurde erfolgreich versendet")
            case .failed:
                print("Fehler beim Versenden der E-Mail: \(error?.localizedDescription ?? "Unbekannter Fehler")")
            default:
                break
            }
            
            // Schließe das E-Mail-Fenster
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailNewView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.setToRecipients(["victor@gate17.de"])
        viewController.setSubject("Feedack for HealthMetrics")
        viewController.setMessageBody("\(UIDevice.current.systemName) \n \(UIDevice.current.systemVersion) \n \(UIDevice.current.systemName) \n Describe your concern below this line. \n", isHTML: false)
        viewController.mailComposeDelegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailNewView>) {
        
    }
}

#Preview {
    MailNewView()
}
