//
//  AniiChanApp.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct AniiChanApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: Root.State()
                ) {
                    Root()
                }
            )
        }
    }
}
