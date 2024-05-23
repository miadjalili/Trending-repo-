//
//  RepositoriesViewModel.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation


final class RepositoriesViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var Repositories: [RepositorieModel] = []
    @Published var hasError = false
    //GET Method
    @MainActor
    func getRepositories() async {
        defer{isLoading = false}
       
        self.isLoading = true
        self.Repositories = []
        self.hasError = false

        let data = await APIClient.dispatch(
            
                APIRouter.GetRepositorie(queryParams: APIParameters.ProductParams(q: "language", sort: "stars"))
                        )
      
        
        //Simply we can check http status code here to do any action needed
        guard ((200..<300) ~= data._httpStatusCode) else {
            Log.error("Server response error")
             loadRepositoriesFromCoreData()
            self.hasError = true

            return
        }
        
        switch data._result {
        case .success(let Repositorie):
            self.Repositories = Repositorie.Repositories
           
            if let jsonData = try? JSONEncoder().encode(Repositorie.Repositories) {
                CoreDataManager.shared.addRepo(Vm: jsonData)
            }
            
            
            
            
        case .failure(let error):
            Log.error(error.localizedDescription)
            self.hasError = true
           
        }
        
        // Load data from CoreData
        func loadRepositoriesFromCoreData() {
           
            if let lastData = CoreDataManager.shared.fetchRepo() ,
               let lastRepo = try? JSONDecoder().decode([RepositorieModel].self, from: lastData) {
                self.Repositories = lastRepo
             
            }else
            {
                print("Error")
               
            }
              
        }
    }
}
    
    
    

