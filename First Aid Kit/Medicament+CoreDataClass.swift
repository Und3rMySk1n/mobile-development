//
//  Medicament+CoreDataClass.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 19/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Medicament)
public class Medicament: NSManagedObject {

    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Medicament"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
    
}
