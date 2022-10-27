//
//  Item+CoreDataProperties.swift
//  test app
//
//  Created by Prefect on 27.10.2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?

}

extension Item : Identifiable {

}
