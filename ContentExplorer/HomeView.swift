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

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                // This is the way to pass a binded state to a component.
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal) // 16 by default
            .padding(.leading, 14) // We add 14 to the left side because we want the text to be align with the scroll
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) { // This is the way to make an horizontal scroll.
                HStack(spacing: 30 ) {
                    ForEach(0 ..< 5) { item in
                        SectionView()
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
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white) // This changes the font color
                Spacer()
                Image("Logo1")
            }
            
            Text("18 Sections".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(Color("card1"))
        .cornerRadius(30)
        .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
