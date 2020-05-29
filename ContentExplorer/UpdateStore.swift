//
//  UpdateStore.swift
//  ContentExplorer
//
//  Created by Sebastián on 29/05/20.
//  Copyright © 2020 Sebastian Garcia. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
    
}
