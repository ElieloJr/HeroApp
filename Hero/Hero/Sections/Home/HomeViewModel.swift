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
    var emailUser = ""
    
    func fetchFavorites(completion: @escaping (Result<[FavoritesHeros], Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FavoritesHeros>(entityName: "FavoritesHeros")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            completion(.success(result))
        } catch { completion(.failure(error)) }
    }
    func fetchPerfilUser(completion: @escaping (Result<[PerfilUser], Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PerfilUser>(entityName: "PerfilUser")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            completion(.success(result))
        } catch { completion(.failure(error)) }
    }
    func fetch() {
        fetchFavorites { result in
            switch result {
            case .success(let managedObjects): self.favorites = managedObjects.reversed()
            case .failure(let error): print(error)
            }
        }
        fetchPerfilUser { result in
            switch result {
            case .success(let users):
                for user in users {
                    if user.email == self.emailUser {
                        print("\(String(describing: user.email)) -> \(String(describing: user.image))")
                    }
                }
            case .failure(_):
                print("")
            }
        }
    }
}
