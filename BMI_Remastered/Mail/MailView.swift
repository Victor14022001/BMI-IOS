//
//  MailView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 10.11.23.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.setCcRecipients(["victor@gate17.de"])
        viewController.setSubject("Feedack for HealthMetrics")
        viewController.setMessageBody("\(UIDevice.current.name) \n \(UIDevice.current.systemVersion) \n \(UIDevice.current.systemName) \n Enter your text here...", isHTML: false)
        viewController.mailComposeDelegate = context.coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}

#Preview {
    MailView()
}
