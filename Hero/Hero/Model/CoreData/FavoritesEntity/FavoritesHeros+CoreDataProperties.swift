//
//  FavoritesHeros+CoreDataProperties.swift
//  Hero
//
//  Created by Usr_Prime on 25/04/22.
//
//

import Foundation
import CoreData


extension FavoritesHeros {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesHeros> {
        return NSFetchRequest<FavoritesHeros>(entityName: "FavoritesHeros")
    }

    @NSManaged public var groupAffiliation: String?
    @NSManaged public var base: String?
    @NSManaged public var placeOfBirth: String?
    @NSManaged public var firstAppearence: String?
    @NSManaged public var race: String?
    @NSManaged public var publisher: String?
    @NSManaged public var power: String?
    @NSManaged public var combat: String?
    @NSManaged public var speed: String?
    @NSManaged public var strength: String?
    @NSManaged public var durability: String?
    @NSManaged public var inteligence: String?
    @NSManaged public var characterName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var image: String?
    @NSManaged public var identifier: UUID?

}

extension FavoritesHeros : Identifiable {

}
