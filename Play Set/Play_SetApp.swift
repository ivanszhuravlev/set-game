//
//  Play_SetApp.swift
//  Play Set
//
//  Created by dtermined on 02.04.2021.
//

import SwiftUI

@main
struct Play_SetApp: App {
    var body: some Scene {
        WindowGroup {
            let game = GameModelController()
            GameView(gameModel: game)
        }
    }
}
