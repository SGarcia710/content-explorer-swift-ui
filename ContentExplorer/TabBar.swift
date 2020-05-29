//
//  TabBar.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
      TabView {
        Home().tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }
        ContentView().tabItem {
          Image(systemName: "rectangle.stack.fill")
          Text("Certificates")
        }
      }
      
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
//      Group {
//        TabBar().previewDevice("iPhone 8")
//        TabBar().previewDevice("iPhone X")
//        TabBar().previewDevice("iPhone 11")
//        TabBar().previewDevice("iPhone 11 Pro Max")
//      } // This way we can preview on a group of devices
      TabBar()
    }
}
