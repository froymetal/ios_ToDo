//
//  ToDoListViewModel.swift
//  ToDoList2
//
//  Created by Field Employee on 6/22/21.
//

import Foundation

class TodoListViewModel {
    var todos = [Todo]()
    var count: Int{
        return todos.count
    }
    
    init() {
        self.refreshData()
    }
    
    func todoAtIndex(_ index: Int) -> Todo {
        return todos[index]
    }
    
    func refreshData(){
        self.todos = CoreDataManager.shared.getAlltodos()
    }
    
    func completeTaskAtIndex(_ index: Int, competion: @escaping(Bool) -> Void){
        self.refreshData()
        CoreDataManager.shared.completeTask(todo: todos[index], completion: competion)
        
    }
    
    func deleteTodos(_ index: Int) -> Todo {
        self.todos.remove(at: index)
    }
    
    
    
}

