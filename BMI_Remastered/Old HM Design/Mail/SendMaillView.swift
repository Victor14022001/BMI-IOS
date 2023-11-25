//
//  SendMaillView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 10.11.23.
//

import SwiftUI
import MessageUI

struct SendMaillView: View {
    @State private var showMailView: Bool = false

    var body: some View {
        List {
            Text("Please send us an email if you have any problems or ideas for new features.")

            HStack {
                Text("Device:")
                Text(UIDevice.current.name)
            }

            HStack {
                Text("OS and Version:")
                Text("\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
            }

            if MFMailComposeViewController.canSendMail() {
                Button("Send Mail") {
                    self.showMailView.toggle()
                }
            } else {
                Text("Can't send Mail from this Device.")
            }
        }
        .sheet(isPresented: $showMailView) {
            MailView()
        }
    }
}

#Preview {
    SendMaillView()
}
