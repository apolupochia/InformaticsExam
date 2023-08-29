//
//  SaveAndGetTasks.swift
//  informatics
//
//  Created by Алёша Виноградов on 16.08.2023.
//

import Foundation



import CoreData
import SwiftUI
import Foundation

struct SaveAndGetTasks {
    private var viewContext = PersistenceController.shared.container.viewContext
    static let shared = SaveAndGetTasks()
    
    func saveTask(task : Task){
        let newItem = SavedTasks(context : viewContext)
        newItem.str = "NewString_HERE_FOR_TASK"
        newItem.timestamp = Date()
        
        
        
        do {
            let jsonData = try JSONEncoder().encode(task)
            newItem.task = jsonData
        } catch {
          print("failed to archive array with error: \(error)")
        }
        
        do{
            try viewContext.save()
            
        } catch{
            print(error)
        }
    }
    
    
    func deleteItems() {

        withAnimation {
            let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedTasks")
            do {
                let inf = try? viewContext.fetch(fectchReq) as? [SavedTasks]
                inf?.forEach{ i in
                    viewContext.delete(i)
                }
            }
            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
        }
    }
    
    
    func deleteItem(task : Task) {

        withAnimation {
            let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedTasks")
            do {
                let inf = try? viewContext.fetch(fectchReq) as? [SavedTasks]
                inf?.forEach{ i in
                    if findItemInList(task: task, savedTask: i){
                        viewContext.delete(i)
                    }
                    
                }
                
            }
            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
        }
    }
    
    func getItems() -> [SavedTasks]{
        var items : [SavedTasks] = []
        
        let fetchRequest: NSFetchRequest<SavedTasks> = SavedTasks.fetchRequest()
        do {
            items = try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        for item in items {
            if (item.task != nil){
                do {
                    let result = try JSONDecoder().decode(Task.self, from: item.task!) // `jsonData` here is retrieved from core data.
                } catch {
                    
                    print("could not unarchive array: \(error)")
                }
            }
            
        }
        return items
    }
    private func findItemInList(task : Task, savedTask : SavedTasks) -> Bool{
        
        let newTask = getInfoAboutVariantFromDataTasks.shared.getItems(data: savedTask.task)
        if newTask.id == task.id{
            return true
        }

        return false
    }
    func findItem(task : Task) -> Bool{
        var answer = false
        
        let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedTasks")
        do {
            let inf = try? viewContext.fetch(fectchReq) as? [SavedTasks]
            inf?.forEach{ i in
                if findItemInList(task: task, savedTask: i){
                    answer = true
                }
    
            }
            
        }
        return answer
    }
}


struct getInfoAboutVariantFromDataTasks{
    
    static let shared = getInfoAboutVariantFromDataTasks()
    
    func getItems(data : Data?) -> Task{
        var variant : Task = Task(id: 0, numberOfTask: 0, task: "error", taskSolution: "", rightAnswer: "error")
        
        do {
            variant = try JSONDecoder().decode(Task.self, from: data!)
            return variant
            
        } catch {

          print("could not unarchive array: \(error)")
        }
        return variant
    }
    
    
}






