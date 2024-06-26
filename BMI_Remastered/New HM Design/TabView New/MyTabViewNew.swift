//
//  MyTabViewNew.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 21.11.23.
//

import SwiftUI
import UIKit
import UserNotifications

struct MyTabViewNew: View {
    @ObservedObject var viewModel: BmiViewModel = .init()

    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "appBlue")
    }

    var body: some View {
        TabView {
            ContentBmiViewNew(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
 
            SettingsViewNew(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }

            DiaryNewView()
                .tabItem {
                    Label("Diary", systemImage: "pencil")
                }
            
            FruitsNewView()
                .tabItem {
                    Label("Fruits", systemImage: "apple.logo")
                }
        }
        .accentColor(Color("appOrange"))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MyTabViewNew()
}
