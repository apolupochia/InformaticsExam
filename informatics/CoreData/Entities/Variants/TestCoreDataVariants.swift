//
//  Content.swift
//  informatics
//
//  Created by Алёша Виноградов on 14.08.2023.
//

import Foundation

import SwiftUI
import CoreData

struct ContentView1: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Variants>

    var body: some View {
        NavigationView {
            VStack{
                
            ForEach(items) { item in
                NavigationLink {
                    //Text(item.str ?? "dont save")
                    
                } label: {
                   // Text(item.str ?? "dont save")
                    Text(item.timestamp!, formatter: itemFormatter)
                }
            }
                Button {
                    SaveAndGet.shared.saveTask(variant: realVariant)
                   // addItem()
                } label: {
                    Text("save")
                }
                
                Button {
                    SaveAndGet.shared.getItems()
                   // addItem()
                } label: {
                    Text("get")
                }

                Button {
                    SaveAndGet.shared.deleteItems()
                   // addItem()
                } label: {
                    Text("delete all")
                }
            }
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.str = "STRING_HERE"
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    formatter.dateFormat = "HH:mm, d MMM yyyy"
  //  formatter.
    return formatter
}()

struct ContentView1_Previews: PreviewProvider {
    let persistenceController = PersistenceController.shared
    static var previews: some View {
        ContentView1()
      //      .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
