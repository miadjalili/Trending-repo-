//
//  RepositoriesViewModel.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation


final class RepositoriesViewModel: ObservableObject {
    
    @Published var Repositories: [RepositorieModel] = []
    
    //GET Method
    @MainActor
    func getRepositories() async {
        let data = await APIClient.dispatch(
            APIRouter.GetRepositorie(queryParams:
                                        APIParameters.ProductParams(q: "language")))
        
        //Simply we can check http status code here to do any action needed
        guard ((200..<300) ~= data._httpStatusCode) else {
            Log.error("Server response error")
            return
        }
        
        switch data._result {
        case .success(let Repositorie):
            self.Repositories = Repositorie.Repositories
        case .failure(let error):
            Log.error(error.localizedDescription)
        }
    }
    
    
}
