//
//  AddNewTaskViewController.swift
//  ToDoList2
//
//  Created by Froy on 6/22/21.
//

import UIKit

class AddNewTaskViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskdueDate: UIDatePicker!
    @IBOutlet weak var TaskDate: UITextField!
    @IBOutlet weak var TimeTD: UITextField!
    @IBOutlet weak var SaveTaskButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.delegate = self
        TaskDate.delegate = self
        
    // Set Save Button initially disabled
        SaveTaskButton.isEnabled = false
        
    // Make the User not allow to pick from the past date
        taskdueDate.minimumDate = Date()
        
    // Set the default value on Date and Time textfield, Set Cursor on Task text Field
        taskName.becomeFirstResponder()
        let _: UITextPosition = taskName.beginningOfDocument
    
   //  DatePicker, Calls dateChanged to format Date and Time
        taskdueDate.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        TaskDate.inputView = taskdueDate
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        TaskDate.inputAccessoryView = toolBar
        
    }
    
    // Set default value(Current Date and Time) calls dateChanged()
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

      if TaskDate.text!.isEmpty {
            dateChanged()
      }
      return true
    }
    
    //Disable and Enable Save Button (Task Name Must be filled in First!)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            let text = (taskName.text! as NSString).replacingCharacters(in: range, with: string)
            if !text.isEmpty{
                SaveTaskButton.isEnabled = true
            } else {
                SaveTaskButton.isEnabled = false
            }
            return true
        }
    
    @objc func datePickerDone() {
        TaskDate.resignFirstResponder()
       }
    
    // Date and Time Formatter
       @objc func dateChanged() {
        
        //Format Date
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM dd yyyy"
            let selectDate = dateformatter.string(from: taskdueDate.date)
            TaskDate.text = "\(selectDate)"
        
        //Format Time
            let timeformatter = DateFormatter()
            timeformatter.dateFormat = "MM dd yyyy"
            timeformatter.timeStyle = .short
            let selectTime = timeformatter.string(from: taskdueDate.date)
            TimeTD.text = "\(selectTime)"

       }

    @IBAction func saveNewTask(_sender: UIBarButtonItem) {
                let vm = AddNewTaskViewModel(name: taskName.text ?? "No Name", date: taskdueDate.date)
                vm.saveTask {_ in
                    DispatchQueue.main.async {
                self.navigationController?
                    .popViewController(animated: true)
            }
        }
    }
    
    
}

