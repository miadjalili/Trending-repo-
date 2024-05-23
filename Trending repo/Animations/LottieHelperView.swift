//
//  LottieHelperView.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-05-17.
//

import SwiftUI
import Lottie

struct LottieHelperView: View {
    var fileName: String = "retry-and-user-busy-version-2"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .loop
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({ LottieAnimationView in
                LottieAnimationView.contentMode = contentMode
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
        
     
            
    }
}

#Preview {
    LottieHelperView()
}
