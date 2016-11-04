//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Matthew on 16/11/4.
//  Copyright © 2016年 Matthew. All rights reserved.
//

import CoreData

class CoreDataManager {
    
    class func fetchEntities(entityname: String) -> [AnyObject] {
        let managedObjectContext = CoreDataStack.sharedStack.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: entityname)
        
        var entities: [AnyObject] = []
        
        do {
            entities = try managedObjectContext.executeFetchRequest(fetchRequest)
        } catch let error as NSError {
            print("Error: \(error) " + "description \(error.localizedDescription)")
        }
        
        return entities
    }
    
     class func saveContext() {
        let managedObjectContext = CoreDataStack.sharedStack.managedObjectContext
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print("Could not save: \(error.localizedDescription)")
                
                abort()
            }
        }
    }
}
