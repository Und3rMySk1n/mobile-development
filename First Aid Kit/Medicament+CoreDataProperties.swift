//
//  Medicament+CoreDataProperties.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 19/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//
//

import Foundation
import CoreData


extension Medicament {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicament> {
        return NSFetchRequest<Medicament>(entityName: "Medicament")
    }

    @NSManaged public var name: String?
    @NSManaged public var expires: NSDate?
    @NSManaged public var info: String?
    @NSManaged public var category: Category?

}
