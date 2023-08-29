//
//  SaveGetAndDelete.swift
//  informatics
//
//  Created by Алёша Виноградов on 14.08.2023.
//

import CoreData
import SwiftUI
import Foundation

struct SaveAndGet {
    private var viewContext = PersistenceController.shared.container.viewContext
    static let shared = SaveAndGet()
    
    func saveTask(variant : InfoAboutVariant ){
        let newItem = Variants(context : viewContext)
        newItem.timestamp = Date()
        
        do {
            let jsonData = try JSONEncoder().encode(variant)
            newItem.variant = jsonData
        } catch {
          print("failed to archive array with error: \(error)")
        }
        
        do{
            try viewContext.save()
            
        } catch{
            
            print(error)
        }
        

    }
    
    func deleteItem(variant : InfoAboutVariant) {
        withAnimation {
            let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Variants")
            do {
                let inf = try? viewContext.fetch(fectchReq) as? [Variants]
                inf?.forEach{ i in
                    if findVariantInList(variant: variant, savedVariant: i){
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
    
    
    func deleteItems() {

        withAnimation {
            let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Variants")
            do {
                let inf = try? viewContext.fetch(fectchReq) as? [Variants]
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
    
    func getItems() -> [Variants]{
        var items : [Variants] = []
        
        let fetchRequest: NSFetchRequest<Variants> = Variants.fetchRequest()
        do {
            items = try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        
        for item in items {
            if (item.variant != nil){ 
                do {
                    let result = try JSONDecoder().decode([InfoAboutVariant].self, from: item.variant!) // `jsonData` here is retrieved from core data.
                } catch {
                    
                    print("could not unarchive array: \(error)")
                }
            }
        }
        return items
    }
    
    private func findVariantInList(variant : InfoAboutVariant, savedVariant : Variants ) -> Bool{
        
        let newTask = getInfoAboutVariantFromData.shared.getItems(data: savedVariant.variant)
        if newTask.variantNamber == variant.variantNamber{
            return true
        }
        return false
    }
    
    func findVariant(variant : InfoAboutVariant) -> Bool{
        
        var answer = false
        let fectchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Variants")
        do {
            let inf = try? viewContext.fetch(fectchReq) as? [Variants]
            inf?.forEach{ i in
                
                if findVariantInList(variant: variant, savedVariant: i){
                    answer = true
                }
            }
        }
        return answer
    }
}


struct getInfoAboutVariantFromData{
    
    static let shared = getInfoAboutVariantFromData()
    
    func getItems(data : Data?) -> InfoAboutVariant{
        var variant = InfoAboutVariant(id: 0, variantName: "Error", variantNamber: 0, variant: [Task(id: 0, numberOfTask: 0, task: "Error", taskSolution: "", rightAnswer: "Error")])
        
        do {
            variant = try JSONDecoder().decode(InfoAboutVariant.self, from: data!)
            return variant
            
        } catch {

          print("could not unarchive array: \(error)")
        }
        return variant
    }
    
    
}






