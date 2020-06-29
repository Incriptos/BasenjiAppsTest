//
//  Repositories+CoreDataProperties.swift
//  
//
//  Created by Andrew Vashulenko on 29.06.2020.
//
//

import Foundation
import CoreData


extension Repositories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Repositories> {
        return NSFetchRequest<Repositories>(entityName: "Repositories")
    }

    @NSManaged public var avatar: String
    @NSManaged public var name: String
    @NSManaged public var fullName: String
    @NSManaged public var descript: String
    @NSManaged public var starz: Int64
    @NSManaged public var updateAt: String
    @NSManaged public var url: String
    @NSManaged public var languege: String

}
