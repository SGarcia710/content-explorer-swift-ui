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
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        ZStack {
            // We will ignore the safe areas on each thing we want to ignore them. This is better than ignoring the safe areas at the Root container, because it will make all its children to ignore safe areas, and thats maybe something we dont want.
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) // Root background
                .edgesIgnoringSafeArea(.all) // This will make this View to be over the safe areas too. (.all applies it to all of them)
            
            
          HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top, 44) // Because we want a background color for our VStack, we will have to ignore the safe areas, but with this the content will move also and maybe will be on the safe area. So, we use this padding top of 44 to move it down again. (44 is the height of the Status bar safe area)
                // Obiously this will cause a problem... We will have to handle what kind of device is opening the app, because for example the iPhone 8 doesnt have notch.
                .background(
                  VStack {
                    LinearGradient(gradient: Gradient(colors: [Color("background2"), Color.white]), startPoint: .top, endPoint: .bottom)
                      .frame(height: 200)
                    Spacer()
                  }
                  .background(Color.white)
                ) // Now we can setup our background
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all) // We can ignore the safe areas without any problem.
            
            
            MenuView()
                .background(Color.black.opacity(0.001)) // We set a semi invisible background to have the way to touch it and toggle the views. It wont work if we use 0, because Swift will take it as a non existent thing.
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height) // With this line we are able to drag our card, because we are setting the viewState value with the drag gesture.
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
                .gesture( // This will be a drag gesture that will track the position and save it to the viewState
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    }
          )
          
          if showContent {
            Color.white.edgesIgnoringSafeArea(.all)
            ContentView()
            VStack {
              HStack {
                Spacer()
                Image(systemName: "xmark")
                  .frame(width: 36, height: 36)
                  .foregroundColor(.white)
                  .background(Color.black)
                  .clipShape(Circle())
              }
              Spacer()
            }
            .offset(x: -16, y: 16)
            .transition(.move(edge: .top))
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
            .onTapGesture {
              self.showContent = false
            }
          }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    // This is the way to get or bind to this view the state of the parent view
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

// This is going to allow us to detect the dimensions of the screen
let screen = UIScreen.main.bounds
