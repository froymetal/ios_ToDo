//
//  ToDoTableCell.swift
//  ToDoList2
//
//  Created by Field Employee on 6/22/21.
//

import UIKit

class ToDoTableCell: UITableViewCell{
@IBOutlet private weak var taskNameLabel: UILabel!
@IBOutlet private weak var taskDueDate: UILabel!
@IBOutlet private weak var taskCompleteDate: UILabel!
    
    var todo: Todo? {
        didSet {
            if let todo = ToDo{
                if todo.completed == false{
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                             todo.dueDate!.toString(format: "MM dd yyyy"))
                    taskCompleteDate.text = "To be completed"
                }else{
                    taskNameLabel.attributedText = todo.name!.strikeThrough()
                    
                    taskDueDate.attributedText = String(format: "Due on %@",
                                                        todo.dueDate!.toString(format: "MM dd yyyy")).strikeThrough()
                    taskCompleteDate.text = String(format:"Completed on %@",
                                                   todo.dueDate!.toString(format: "MM dd yyyy"))
                }
            }
        }
    }
    
    override func prepareForReuse() {
        taskNameLabel.attributedText = taskNameLabel.text!.removeAttributedText()
        taskDueDate.attributedText = taskDueDate.text!.removeAttributedText()
        taskNameLabel.text = ""
        taskDueDate.text = ""
        taskCompleteDate.text = ""
        super.prepareForReuse()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
