//
//  Home.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            // We will ignore the safe areas on each thing we want to ignore them. This is better than ignoring the safe areas at the Root container, because it will make all its children to ignore safe areas, and thats maybe something we dont want.
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) // Root background
                .edgesIgnoringSafeArea(.all) // This will make this View to be over the safe areas too. (.all applies it to all of them)
            
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: { self.showProfile.toggle() }) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer() // This will push everything to the top
            }
                .padding(.top, 44) // Because we want a background color for our VStack, we will have to ignore the safe areas, but with this the content will move also and maybe will be on the safe area. So, we use this padding top of 44 to move it down again. (44 is the height of the Status bar safe area)
                // Obiously this will cause a problem... We will have to handle what kind of device is opening the app, because for example the iPhone 8 doesnt have notch.
                .background(Color.white) // Now we can setup our background
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all) // We can ignore the safe areas without any problem.
            
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
