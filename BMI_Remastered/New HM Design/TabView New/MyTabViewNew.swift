//
//  MyTabViewNew.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 21.11.23.
//

import SwiftUI
import UIKit

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
        }
        .accentColor(Color("appOrange"))
        .preferredColorScheme(.dark)
       // .environment(\.colorScheme, viewModel.isDarkmodeEnabled ? .dark: .light)
    }
}

#Preview {
    MyTabViewNew()
}
