//
//  Date+Extentions.swift
//  ToDoList2
//
//  Created by Field Employee on 6/22/21.
//

import Foundation

extension Date {
    func toString(format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
