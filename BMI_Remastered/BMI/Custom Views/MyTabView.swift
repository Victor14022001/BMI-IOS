//
//  TabView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            Settings(viewModel: BmiViewModel())
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
    }
}


#Preview {
    MyTabView()
}
