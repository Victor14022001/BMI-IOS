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
            Text("Tab 1")
                .tabItem {
                    Label("one", systemImage: "star")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}


#Preview {
    MyTabView()
}
