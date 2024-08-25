//
//  hls360videomaterialApp.swift
//  hls360videomaterial
//
//  Created by Yasuhito Nagatomo on 2024/08/25.
//

import SwiftUI

@main
struct HLS360VideoMaterialApp: App {
    @State private var appModel = AppModel()
    private let initialWindowSize: CGSize = CGSize(width: 800, height: 400)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(initialWindowSize)

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
