import SwiftUI

struct Test: View {
    var body: some View {
        
        TabView {
                   Text("Tab 1")
                       .tabItem {
                           Label("Start", systemImage: "house")
                       }
                   
                   Text("Tab 2")
                       .tabItem {
                           Label("Liste", systemImage: "list.bullet")
                       }
               }
           }
       }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

