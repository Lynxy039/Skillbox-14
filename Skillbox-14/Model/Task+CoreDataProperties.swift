//
//  Task+CoreDataProperties.swift
//  Skillbox-14
//
//  Created by Антон Тимоненков on 09.07.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var text: String?

}
