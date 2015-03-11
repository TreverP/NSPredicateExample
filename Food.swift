//
//  Food.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import Foundation
import CoreData

@objc(Food)
class Food: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var person: Person

}
