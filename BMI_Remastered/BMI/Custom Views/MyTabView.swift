//
//  TabView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI

struct MyTabView: View {
    @ObservedObject var viewModel: BmiViewModel = .init()

    var body: some View {
        TabView {
            ContentView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Settings(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .environment(\.colorScheme, viewModel.isDarkmodeEnabled ? .dark: .light)
    }
}


#Preview {
    MyTabView()
}
