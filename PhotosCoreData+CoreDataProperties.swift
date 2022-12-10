//
//  PhotosCoreData+CoreDataProperties.swift
//  
//
//  Created by Вячеслав on 09.12.2022.
//
//

import Foundation
import CoreData


extension PhotosCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotosCoreData> {
        return NSFetchRequest<PhotosCoreData>(entityName: "PhotosCoreData")
    }

    @NSManaged public var image: String?
    @NSManaged public var userImage: String?
    @NSManaged public var userName: String?
    @NSManaged public var likes: String?
    @NSManaged public var dateAt: String?

}
