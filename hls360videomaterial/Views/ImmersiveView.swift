//
//  ImmersiveView.swift
//  hls360videomaterial
//
//  Created by Yasuhito Nagatomo on 2024/08/25.
//

import SwiftUI
import RealityKit
import AVFoundation

struct ImmersiveView: View {
    @State var playerLooper: AVPlayerLooper!

    var body: some View {
        RealityView { content in
            let mesh = MeshResource.generateSphere(radius: 1.0)

            // This sample HLS video is hosted by GitHub Pages as a HTTP server, just for testing.
            let url = URL(string: "https://ynagatomo.github.io/HLS360VideoMaterial/contents/bike/prog_index.m3u8")!

            let playerItem = AVPlayerItem(url: url)
            let player = AVQueuePlayer()
            playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
            let material = VideoMaterial(avPlayer: player)
            let entity = ModelEntity(mesh: mesh, materials: [material])
            entity.position = [0, 1.5, -1.5]
            entity.scale = [-1, 1, 1]
            entity.orientation = simd_quatf(angle: Float.pi / 2.0, axis: [0, 1, 0])
            content.add(entity)

            player.play()
        }
    }
}

//    #Preview(immersionStyle: .mixed) {
//        ImmersiveView()
//            .environment(AppModel())
//    }
