//
//  Variants+CoreDataProperties.swift
//  informatics
//
//  Created by Алёша Виноградов on 14.08.2023.
//
//

import Foundation
import CoreData


extension Variants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variants> {
        return NSFetchRequest<Variants>(entityName: "Variants")
    }

    @NSManaged public var variant: Data?
    @NSManaged public var variantName: String?
    @NSManaged public var timestamp : Date?

}

extension Variants : Identifiable {

}
