//
//  WhatDaApp.swift
//  WhatDa
//
//  Created by Chitransh on 13/09/26.
//

import SwiftData
import SwiftUI

@main
struct WhatDaApp: App {
    var body: some Scene {
        WindowGroup {
            CameraView()
                .preferredColorScheme(.dark)
                .modelContainer(AppEnvironment.shared.modelContainer)
        }
    }
}
