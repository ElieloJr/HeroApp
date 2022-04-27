//
//  PerfilUser.swift
//  Hero
//
//  Created by Usr_Prime on 27/04/22.
//

import Foundation
import CoreData
import UIKit

@objc(PerfilUser)
class PerfilUser: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PerfilUser> {
        return NSFetchRequest<PerfilUser>(entityName: "PerfilUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var identifier: UUID?
    @NSManaged public var image: UIImage

}

extension PerfilUser : Identifiable {

}
