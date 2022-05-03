//
//  DetailViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 20/04/22.
//

import Foundation
import CoreData
import UIKit

protocol DetailViewDelegate: AnyObject {
    func setHeader(with fullName: String, _ characterName: String, and characterImage: String)
    func setPowerStats(inteligence: String, durability: String, strength: String, speed: String, combat: String, power: String)
    func setOuthesInfo(publisher: String, race: String, firstAppearence: String, placeOfBirth: String, base: String, groupAffiliation: String)
    func setFavoriteButton()
}

class DetailViewModel {
    var delegate: DetailViewDelegate?
    
    var detailsHero: Details?
    var favoriteHero: FavoritesHeros?
    
    func setupCampsWithSearch() {
        guard let hero = detailsHero else { return }
        
        delegate?.setHeader(with: hero.biography.fullName, hero.name, and: hero.image.url)
        let stats = hero.powerstats
        delegate?.setPowerStats(inteligence: stats.intelligence,
                                durability: stats.durability,
                                strength: stats.strength,
                                speed: stats.speed,
                                combat: stats.combat,
                                power: stats.power)
        
        delegate?.setOuthesInfo(publisher: hero.biography.publisher,
                                race: hero.appearance.race,
                                firstAppearence: hero.biography.firstAppearance,
                                placeOfBirth: hero.biography.placeOfAppearance,
                                base: hero.work.base,
                                groupAffiliation: hero.connections.groupAffiliation)
    }
    func setupCampsWithFavorite() {
        guard let favorite = favoriteHero else { return }

        delegate?.setHeader(with: favorite.fullName!, favorite.characterName!, and: favorite.image!)
        delegate?.setPowerStats(inteligence: favorite.inteligence!,
                                durability: favorite.durability!,
                                strength: favorite.strength!,
                                speed: favorite.speed!,
                                combat: favorite.combat!,
                                power: favorite.power!)
        
        delegate?.setOuthesInfo(publisher: favorite.publisher!,
                                race: favorite.race!,
                                firstAppearence: favorite.firstAppearence!,
                                placeOfBirth: favorite.placeOfBirth!,
                                base: favorite.base!,
                                groupAffiliation: favorite.groupAffiliation!)
        delegate?.setFavoriteButton()
    }
    func addFavoriteHero() {
        guard let hero = detailsHero else { return }
        
        saveFavorite(with: hero) { (result) in
            switch result {
            case .success(let finished):
                if finished { self.delegate?.setFavoriteButton() }
            case .failure(_): print("Não deu certo") }
        }
    }
    func removeFavoriteHero() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(favoriteHero! as NSManagedObject)
        do {
            try managedContext.save()
            self.delegate?.setFavoriteButton()
        } catch _ { }
    }
}

extension DetailViewModel {
    private func saveFavorite(with hero: Details, completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoritesHeros", in: managedContext)!
        let favorites = NSManagedObject(entity: entity, insertInto: managedContext)
        
        favorites.setValue(UUID(), forKey: "identifier")
        favorites.setValue(hero.image.url, forKey: "image")
        favorites.setValue(hero.biography.fullName, forKey: "fullName")
        favorites.setValue(hero.name, forKey: "characterName")
        
        favorites.setValue(hero.powerstats.intelligence, forKey: "inteligence")
        favorites.setValue(hero.powerstats.durability, forKey: "durability")
        favorites.setValue(hero.powerstats.strength, forKey: "strength")
        favorites.setValue(hero.powerstats.speed, forKey: "speed")
        favorites.setValue(hero.powerstats.combat, forKey: "combat")
        favorites.setValue(hero.powerstats.power, forKey: "power")
        
        favorites.setValue(hero.biography.publisher, forKey: "publisher")
        favorites.setValue(hero.appearance.race, forKey: "race")
        favorites.setValue(hero.biography.firstAppearance, forKey: "firstAppearence")
        favorites.setValue(hero.biography.placeOfAppearance, forKey: "placeOfBirth")
        favorites.setValue(hero.work.base, forKey: "base")
        favorites.setValue(hero.connections.groupAffiliation, forKey: "groupAffiliation")
        
        do {
            try managedContext.save()
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
}
