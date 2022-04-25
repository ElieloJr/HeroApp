//
//  HomeViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 12/04/22.
//

import UIKit
import CoreData

class HomeViewModel {
    var favorites: [FavoritesHeros] = []
    var remove: FavoritesHeros?
    
    func fetchFavorites(completion: @escaping (Result<[FavoritesHeros], Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FavoritesHeros>(entityName: "FavoritesHeros")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
    func fetch() {
        fetchFavorites { result in
            switch result {
            case .success(let managedObjects): self.favorites = managedObjects.reversed()
            case .failure(let error): print(error)
            }
        }
    }
}
