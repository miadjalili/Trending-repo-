//
//  ImageLoaderView.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = ""
    let reszingMode: ContentMode = .fill

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                if !urlString.isEmpty && urlString != nil
                {
                WebImage(url: URL(string: urlString ))
                    .resizable()
                    .indicator(.activity )
                    .aspectRatio(contentMode: .fill)
                    .allowsHitTesting(false)
            }else
                {
                Image(systemName: "placeholdertext.fill")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .redactShimmer(condition: true)
                    
            }
            }
            .clipped()
        
       
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
