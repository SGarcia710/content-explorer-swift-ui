//
//  UpdateList.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
  // This way we can connect our UpdateList to the Combine Store UpdateStore
  @ObservedObject var store = UpdateStore()
  
  
  func addUpdate() {
    store.updates.append(Update(image: "Card1", title: "Combine", text: "Learn how to do Reactive Programming natively on iOS.", date: "OCT 23"))
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(store.updates) { update in // Mapping the store's data, will allow us to manipulate the data in real time
          NavigationLink(destination: UpdateDetail(update: update)) {
            HStack {
              Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
              VStack(alignment: .leading, spacing: 8) {
                Text(update.title)
                  .font(.system(size: 20, weight: .bold))
                Text(update.text)
                  .lineLimit(2)
                  .font(.subheadline)
                  .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                Text(update.date)
                  .font(.caption)
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding(.vertical, 8)
          }
        }
        .onDelete { index in // We map the NavigationLinks with the foreach instead the List wrapper because we want to add this modifier .
          self.store.updates.remove(at: index.first!) // We do force unwrapp because its an optional
        }
        .onMove { (source: IndexSet, destination: Int) in // We use this modifier to allow the user to move the items on the list when he presses the Edit button.
          self.store.updates.move(fromOffsets: source, toOffset: destination)
        }
      }
      .navigationBarTitle(Text("Updates"))
      .navigationBarItems(leading: Button(action: addUpdate) {
        Text("Add update")
      }, trailing: EditButton()) // Edit button shows the available options with the List Items.
    }
  }
}

struct UpdateList_Previews: PreviewProvider {
  static var previews: some View {
    UpdateList()
  }
}


// Data model
struct Update: Identifiable {
  var id = UUID()
  var image: String
  var title: String
  var text: String
  var date: String
}

let updateData = [
  Update(image: "Card1", title: "SwiftUI Advanced", text: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.", date: "FEB 26"),
  Update(image: "Card2", title: "SwiftUI Intermediate", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "NOV 14"),
  Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and web.", date: "AGU 13"),
  Update(image: "Card4", title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor.", date: "JUN 10"),
  Update(image: "Card5", title: "SwiftUI Beginner", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11.", date: "JAN 1"),
]
