//
//  PhotosCoreData+CoreDataClass.swift
//  
//
//  Created by Вячеслав on 09.12.2022.
//
//

import Foundation
import CoreData

@objc(PhotosCoreData)
public class PhotosCoreData: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instatnse.entityForName(entityName: "PhotosCoreData"), insertInto: CoreDataManager.instatnse.context)
    }
}
