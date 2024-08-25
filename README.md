# HLS 360 Video Material for visionOS

A sample project that shows how to use a video material with a HTTP Live Streaming (HLS) 360 video in visionOS.

- Build: Xcode 16.0 beta 6, macOS 15.1 beta
- Target: visionOS 2.0+ (Device or Simulator)




## Use your 360 videos

1. Shoot 360 videos with your favorite capture device such as Theta, Insta 360. (I'm using Theta.)
1. Convert mov/mp4/m4v files you captured to HLS format files, using Apple HLS Tool, Media File Segmenter.
    - You need to install the Apple HLS Tools. See the Apple HTTP Live Streaming page [Web](https://developer.apple.com/streaming/).
1. Store the HLS files on any HTTP server.
1. Change the URL of your HTTP server in the ImmersiveView.swift.

### Convert

```bash
% mediafilesegmenter -f ./output -t 1  R0010062.MP4
% ls output
fileSequence0.ts    fileSequence12.ts    fileSequence16.ts    fileSequence5.ts    fileSequence9.ts
fileSequence1.ts    fileSequence13.ts    fileSequence2.ts    fileSequence6.ts    iframe_index.m3u8
fileSequence10.ts    fileSequence14.ts    fileSequence3.ts    fileSequence7.ts    prog_index.m3u8
fileSequence11.ts    fileSequence15.ts    fileSequence4.ts    fileSequence8.ts
```

Options:

- `-f <path> | --file-base=<path>       : Path at which to store index and media files`
- `-t <dur>  | --target-duration=<dur>  : Target duration for each segment` (default: 10)

Media File Segmenter:

<blockquote>
Media File Segmenter (mediafilesegmenter) divides a transport stream input or file — such as an MOV, MP4, M4V, M4A, or MP3 — into media segments, creates a media playlist, and can also perform segment encryption. You can deploy the media playlist and media segments using almost any web server infrastructure for streaming to iOS, macOS, and tvOS. The Media File Segmenter only produces Video-on-Demand (VOD) streams.</blockquote>
(Apple Article: [Using Apple’s HTTP Live Streaming (HLS) Tools](https://developer.apple.com/documentation/http-live-streaming/using-apple-s-http-live-streaming-hls-tools))

### Place HLS files on the server

Place the files in the `output` folder on any HTTP server.

### Change URL in the `ImmersiveView.swift` to your content's URL.

```swift
let url = URL(string: "https://your_http_server/prog_index.m3u8")!
```

<!--
![Image](assets/ss01.jpg)
-->

<!--
![Gif](assets/mv720pshort.gif)

Examples:
1. <img src="assets/ex01.png" width=80 /> [Basic] Color Ball

![Image](Assets/ss02.jpg)
-->

## Materials

<!--
- HDRI: Oliksiy Yakovlyev, Artist Workshop [Poly Heaven](https://polyhaven.com/a/artist_workshop) 
- Rock Texture Image: Granite 5 PBR Material [Free PBR](https://freepbr.com/materials/granite-5-pbr/)
- Grass illustration: Garden Grass Collection [Designed by Freepik](http://www.freepik.com)
-->

## References

- [Apple HTTP Live Streaming](https://developer.apple.com/streaming/)
- Satoshi's SpatialEffectsVideoPlayer [GitHub](https://github.com/satoshi0212/SpatialEffectsVideoPlayer)
- Satoshi's Presentation "Spacial Effects in visionOS" [Slide](https://www.docswell.com/s/satoshi0212/5L1L8D-2024-08-24-135302)

## License

MIT ![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)
