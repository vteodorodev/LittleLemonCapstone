//
//  Dish+CoreDataClass.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 02/09/2024.
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

    func formatPrice() -> String {
        return "$" + price
    }
    
}
