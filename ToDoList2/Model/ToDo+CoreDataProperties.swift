//
//  ToDo+CoreDataProperties.swift
//  ToDoList2
//
//  Created by Field Employee on 6/24/21.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var completedDate: Date?
    @NSManaged public var dueDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension ToDo : Identifiable {

}
