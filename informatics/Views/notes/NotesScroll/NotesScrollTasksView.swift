//
//  NotesScrollTasksView.swift
//  informatics
//
//  Created by Алёша Виноградов on 14.08.2023.
//

import SwiftUI

struct NotesScrollTasksView: View {
    
    @ObservedObject var coordinator : CoordinatorForNotes
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<SavedTasks>
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true){
                ForEach(items) { item in
                    Button {
                        coordinator.goTaskInfoView(task: getInfoAboutVariantFromDataTasks.shared.getItems(data: item.task))
                    } label: {
                        
                        NotesScrollCellViewForTasks(task:getInfoAboutVariantFromDataTasks.shared.getItems(data: item.task)
                        )
                        
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
         
        }
        .navigationBarTitle( Text("Задания"), displayMode: .automatic)
    }
}

struct NotesScrollTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NotesScrollTasksView(coordinator: CoordinatorForNotes())
    }
}

