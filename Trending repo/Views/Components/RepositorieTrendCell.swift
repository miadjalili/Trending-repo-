//
//  RepositorieTrendCell.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import SwiftUI

struct RepositorieTrendCell: View {
    var imageName: String = ""
    var title:String = ""
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
       
        
        .cornerRadius(6)
    }
}

#Preview {
    RepositorieTrendCell()
}
