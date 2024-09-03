//
//  Dish+CoreDataProperties.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 02/09/2024.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String
    @NSManaged public var price: String
    @NSManaged public var image: String
    @NSManaged public var id: Int64
    @NSManaged public var dishDescription: String
    @NSManaged public var category: String



}

extension Dish : Identifiable {

}
