//
//  RepositorieView.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import SwiftUI

struct RepositorieView: View {
    
    @ObservedObject var viewModel: RepositoriesViewModel = RepositoriesViewModel()
   
    
    
    var body: some View {
        NavigationStack {
          
                    List(viewModel.Repositories, id: \.self) { Repositorie in
                       
                       
                        RepositorieTrendCell(imageName: Repositorie.owner?.avatarURL ?? "", title: Repositorie.name ,libraryName: Repositorie.fullName, desc:Repositorie.description ?? "")
                          
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                    }
                   
                    .toolbar(content: {
                        Image(systemName: "gearshape")
                            .frame(width: 35, height: 35)
                        .foregroundColor(.blue)
                            
                    })
            .navigationTitle("Trending")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
        }
      
        .task {
           await viewModel.getRepositories()
        }
        
    }
}

#Preview {
    RepositorieView()
}
