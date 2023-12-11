//
//  SendMailNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 11.12.23.
//

import SwiftUI
import MessageUI

struct SendMailNewView: View {
    @State private var showMailView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading, spacing: 20) {
                    Text("Please send us an email if you have any problems or ideas for new features.")
                        .foregroundColor(Color("appOrange"))
                        .font(.system(size: 24))
                    
                    HStack {
                        Text("Device:")
                        Text(UIDevice.current.name)
                    }
                    .foregroundColor(Color("appOrange"))
                    .font(.system(size: 24))
                    
                    HStack {
                        Text("OS and Version:")
                        Text("\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
                    }
                    .foregroundColor(Color("appOrange"))
                    .font(.system(size: 24))
                    
                    if MFMailComposeViewController.canSendMail() {
                        Button("Send Mail") {
                            self.showMailView.toggle()
                        }
                        .modifier(ButtonStyle())
                    } else {
                        Text("Can't send Mail from this Device.")
                            .foregroundColor(Color("appOrange"))
                            .font(.system(size: 24))
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
            .sheet(isPresented: $showMailView) {
                MailView()
            }
            .navigationTitle("Contact the Support")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    SendMailNewView()
}
