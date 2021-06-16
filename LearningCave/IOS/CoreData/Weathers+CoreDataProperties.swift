//
//  Weather+CoreDataProperties.swift
//  WeatherAccenture
//
//  Created by Shilpa M on 06/02/21.
//

import Foundation
import CoreData


extension Weathers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weathers> {
        return NSFetchRequest<Weathers>(entityName: "Weathers")
    }

    @NSManaged public var sunrise: String?
    @NSManaged public var sunset: String?
    @NSManaged public var cloud: String?
    @NSManaged public var humidity: String?
    @NSManaged public var pressure: String?
    @NSManaged public var speed: String?
    @NSManaged public var direction: String?
    @NSManaged public var co: String?
    @NSManaged public var distance: String?
    @NSManaged public var date: String?
    @NSManaged public var delete: String?
    @NSManaged public var temp: String?
    @NSManaged public var timeZone: String?
    
    
}

extension Weathers : Identifiable {

}

