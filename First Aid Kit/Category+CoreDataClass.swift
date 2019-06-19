//
//  Category+CoreDataClass.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 19/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Category"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
    
}
