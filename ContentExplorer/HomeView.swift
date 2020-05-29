//
//  HomeView.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @Binding var showProfile: Bool
    @State var showUpdate = false

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                // This is the way to pass a binded state to a component.
                AvatarView(showProfile: $showProfile)
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }
                .sheet(isPresented: $showUpdate) {
                    ContentView()
                }
            }
            .padding(.horizontal) // 16 by default
            .padding(.leading, 14) // We add 14 to the left side because we want the text to be align with the scroll
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) { // This is the way to make an horizontal scroll.
                HStack(spacing: 20 ) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                            .rotation3DEffect(Angle(degrees:
                                Double(geometry.frame(in: .global).minX - 30) / -20
                            ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30) // This is because we dont want our shadow to be cutted of
            }
            
            
            Spacer() // This will push everything to the top
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        // If you are binding states across files, you will have to set the defaults values for the states
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white) // This changes the font color
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

// Data model
struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Protype designs in SwiftUI", text: "18 Sections", logo: "logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Section(title: "Build a SwiftUI app", text: "20 Sections", logo: "logo1", image: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))),
    Section(title: "SwiftUI Advanced", text: "15 Sections", logo: "logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
]
