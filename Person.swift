//
//  Person.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var foods: NSSet

}
