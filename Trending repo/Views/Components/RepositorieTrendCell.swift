//
//  RepositorieTrendCell.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import SwiftUI

struct RepositorieTrendCell: View {
    
    @State var isExpanded = false
    var imageName: String = ""
    var title:String = "placeholder"
    var libraryName:String = "placeholder libraryName"
    var desc:String = "placeholder Desc"
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
                .cornerRadius(6)
            VStack(alignment:.leading,spacing: 12 ,content: {
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                Text(libraryName)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                if isExpanded{
                    Text(desc)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                }
               
                   
            })
           
        }
        
      //  .padding(.trailing, 2)
        .frame(maxWidth: .infinity,alignment: .leading)
        .transition(.move(edge: .bottom))
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                isExpanded.toggle()
                
            }
        }
    }
}

#Preview {
    RepositorieTrendCell()
}
