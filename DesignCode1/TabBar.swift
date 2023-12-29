//
//  TabBar.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 26/12/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem() {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem() {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
                
            }
        }
    }
}



#Preview {
    TabBar()
}
