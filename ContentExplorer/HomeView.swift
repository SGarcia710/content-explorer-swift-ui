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
            .padding(.horizontal)
            .padding(.top, 30)
            
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
