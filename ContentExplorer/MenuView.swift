//
//  MenuView.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Sebastián - 28% completed")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.3843137255, blue: 0.4431372549, alpha: 1)))

                Color.white // Colors are Views too.
                    .frame(width: 38, height: 6) // this add a little frame
                    .cornerRadius(3) // This make its corners with a radius of 3
                    .frame(width: 130, height: 6, alignment: .leading) // This make another frame outside, wrapping the Color View
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding() // Default padding is 16. Now the two frames are inside a Color View with a padding of 16.
                    .frame(width: 150, height: 24) // Now we wrap everything in a bigger frame
                    .background(Color.black.opacity(0.1)) // And make it have a gray-ish color using opacity 0.1
                    .cornerRadius(12)
                
                MenuRow(title: "Account", iconName: "gear")
                MenuRow(title: "Billing", iconName: "creditcard")
                MenuRow(title: "Sign out", iconName: "person.crop.circle")
            }
                .frame(maxWidth: .infinity) // This is going to push the VStack all the way to the left and right side of the screen
                .frame(height:  300) // We cannot combine a frame Modifier height and width with the maxWidth/Height, so you need to separate them
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .padding(.horizontal, 30)
                .overlay( // With this we can overlay with a new view over our VStack. This is necesary because we want the avatar outside the VStack, but it is clipped, so if we add the image inside the VStack and use offset to move it to the top, it will be cutted off.
                    Image("Avatar")
                        .resizable()// This will allow us to resize our image
                        .aspectRatio(contentMode: .fill) // This will make the image fill to the container
                        .frame(width: 60, height: 60) // This will make us a 60x60 image
                        .clipShape(Circle()) // This will clip the image in a Circle shape
                        .offset(y: -150) // Minus the half part of the container.
                )
        }
        .padding(.bottom, 20)
            
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var iconName: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            Text(title).font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
