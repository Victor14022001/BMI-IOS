//
//  test.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 10.11.23.
//
import SwiftUI
import MessageUI

struct Test: View {
    @State private var isShowingMailView = false
    
    var body: some View {
        Button(action: {
            self.isShowingMailView.toggle()
        })
        {
            Text("E-Mail senden")
        }
        .sheet(isPresented: $isShowingMailView) {
            MailView()
        }
    }
}

#Preview {
    Test()
}

struct MailView: UIViewControllerRepresentable {
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        viewController.setSubject("Betreff der E-Mail")
        viewController.setToRecipients(["empfaenger@example.com"])
        viewController.setMessageBody("Hier ist der Text der E-Mail.", isHTML: false)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {
        // Aktualisierungen hier, wenn nötig
    }
}
