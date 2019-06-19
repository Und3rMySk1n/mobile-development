//
//  Category+CoreDataProperties.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 19/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var medicament: NSOrderedSet?

}

// MARK: Generated accessors for medicament
extension Category {

    @objc(insertObject:inMedicamentAtIndex:)
    @NSManaged public func insertIntoMedicament(_ value: Medicament, at idx: Int)

    @objc(removeObjectFromMedicamentAtIndex:)
    @NSManaged public func removeFromMedicament(at idx: Int)

    @objc(insertMedicament:atIndexes:)
    @NSManaged public func insertIntoMedicament(_ values: [Medicament], at indexes: NSIndexSet)

    @objc(removeMedicamentAtIndexes:)
    @NSManaged public func removeFromMedicament(at indexes: NSIndexSet)

    @objc(replaceObjectInMedicamentAtIndex:withObject:)
    @NSManaged public func replaceMedicament(at idx: Int, with value: Medicament)

    @objc(replaceMedicamentAtIndexes:withMedicament:)
    @NSManaged public func replaceMedicament(at indexes: NSIndexSet, with values: [Medicament])

    @objc(addMedicamentObject:)
    @NSManaged public func addToMedicament(_ value: Medicament)

    @objc(removeMedicamentObject:)
    @NSManaged public func removeFromMedicament(_ value: Medicament)

    @objc(addMedicament:)
    @NSManaged public func addToMedicament(_ values: NSOrderedSet)

    @objc(removeMedicament:)
    @NSManaged public func removeFromMedicament(_ values: NSOrderedSet)

}
