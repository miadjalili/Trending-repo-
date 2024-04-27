//
//  CoreDataViewModel.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-26.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    let container : NSPersistentContainer
    @Published var savedEntities: [RepoEntity] = []
    @ObservedObject var viewModel: RepositoriesViewModel = RepositoriesViewModel()
    
    
    init() {
        container = NSPersistentContainer(name: "RepoContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA . \(error)")
            } else {
                print("Successfully loaded Core data!.")
            }
        }
        fetchRepo()
    }
    
    func fetchRepo() {
        let request = NSFetchRequest<RepoEntity>(entityName: "RepoEntity")
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("ERROR FETCHING. \(error)")
        }
       
    }
    
    func addRepo(Vm : RepositorieModel) {
        let newRepo = RepoEntity(context: container.viewContext)
        newRepo.name = Vm.name
        saveData()
    }
    
    
    func saveData(){
        do {
            try container.viewContext.save()
            fetchRepo()
        } catch let error {
            print("Error saving. \(error)")
        }
        
    }
    
    
}
