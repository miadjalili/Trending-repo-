//
//  CoreDataViewModel.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-26.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    
     static let shared = CoreDataManager()
    
    let container : NSPersistentContainer
  
   
    
    
    init() {
        container = NSPersistentContainer(name: "RepoContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA . \(error)")
            } else {
                print("Successfully loaded Core data!.")
            }
        }
       
    }
    
    func fetchRepo() -> Data? {
        let request = NSFetchRequest<RepoEntity>(entityName: "RepoEntity")
        do{
           let savedEntities = try container.viewContext.fetch(request)
           return savedEntities.last?.mainjson
        }catch let error{
            print("ERROR FETCHING. \(error)")
        }
       return nil
    }
    
    func addRepo(Vm : Data) {
        let newRepo = RepoEntity(context: container.viewContext)
        newRepo.mainjson = Vm
        saveData()
    }
    
    
    func saveData(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving. \(error)")
        }
        
    }
    
    
}

