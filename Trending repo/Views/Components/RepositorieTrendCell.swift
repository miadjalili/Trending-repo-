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
    var title: String = "placeholder"
    var libraryName: String = "placeholder libraryName"
    var desc: String = "placeholder Desc"
    var language: String = "language"
    var stars: String = "stars"
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
                .cornerRadius(30)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.light)
                    .lineLimit(1)
                    .padding(.top, 5)
                
                Text(libraryName)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                if isExpanded {
                    Text(desc)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                        .transition(.opacity) // Transition for the description text
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.blue)
                        
                        Text(language)
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.yellow)
                        
                        Text(stars)
                            .font(.callout)
                            .fontWeight(.light)
                    }
                    .frame(width: 250)
                    .padding(.top, 20)
                    .transition(.move(edge: .bottom)) // Transition for the HStack
                }
            }
        }
      
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isExpanded.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepositorieTrendCell()
    }
}
