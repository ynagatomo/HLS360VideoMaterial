//
//  ContentView.swift
//  hls360videomaterial
//
//  Created by Yasuhito Nagatomo on 2024/08/25.
//

import SwiftUI
import RealityKit

struct ContentView: View {

    var body: some View {
        VStack {
            Text("HTTP Live Streaming (HLS) 360 Video Material")
                .font(.largeTitle)
                .padding(44)

            ToggleImmersiveSpaceButton()
                .padding(44)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
