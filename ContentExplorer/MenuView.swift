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
                MenuRow(title: "Account", iconName: "gear")
                MenuRow(title: "Billing", iconName: "creditcard")
                MenuRow(title: "Sign out", iconName: "person.crop.circle")
            }
                .frame(maxWidth: .infinity) // This is going to push the VStack all the way to the left and right side of the screen
                .frame(height:  300) // We cannot combine a frame Modifier height and width with the maxWidth/Height, so you need to separate them
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 30)
                .padding(.horizontal, 30)
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
            Text(title).font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
