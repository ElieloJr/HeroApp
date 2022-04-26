//
//  PerfilUser+CoreDataProperties.swift
//  Hero
//
//  Created by Usr_Prime on 26/04/22.
//
//

import Foundation
import CoreData


extension PerfilUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PerfilUser> {
        return NSFetchRequest<PerfilUser>(entityName: "PerfilUser")
    }

    @NSManaged public var image: String?
    @NSManaged public var email: String?
    @NSManaged public var identifier: UUID?

}

extension PerfilUser : Identifiable {

}
