//
//  HomeCoordinatorForNotes.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import Foundation
import SwiftUI

@MainActor
class CoordinatorForNotes: ObservableObject {
    
    // MARK: Stored Properties
    
    
    @Published var path = NavigationPath()
    @Published var page : MyPagesForNotes = .ChooseTopicFromNotesView
    
    var infoAboutVariant = InfoAboutVariant(id: 0, variantName: "Error", variantNamber: 0, variant: [Task(id: 0, numberOfTask: 0, task: "", taskSolution: "Error", rightAnswer: "Error")])
    var infoAboutTask = Task(id: 0, numberOfTask: 0, task: "Error", taskSolution: "Error", rightAnswer: "Error")

    
    func goHome(){
        path.removeLast(path.count)
    }
    
    func goChooseVariantsView(){
        path.append(MyPagesForNotes.NotesScrollVariantsView)
    }
    
    func goChooseTasksView(){

        path.append(MyPagesForNotes.NotesScrollTasksView)
    }
    
    func goTaskInfoView(task : Task){
        infoAboutTask = task
        path.append(MyPagesForNotes.TaskInfoView)
    }
    
    func goVariantView(variant : InfoAboutVariant){
        infoAboutVariant = variant
        path.append(MyPagesForNotes.VariantView)
    }

    

    

    
    @ViewBuilder
    func getPage(_ page : MyPagesForNotes) -> some View{
        switch page{
        case .ChooseTopicFromNotesView:
            ChooseTopicFromNotesView(coordinator: self)
            
        case .NotesScrollVariantsView:
            NotesScrollVariantsView(coordinator: self)
            
        case .NotesScrollTasksView:
            NotesScrollTasksView(coordinator: self)
            
        case .TaskInfoView:
            TaskInfoView(save: SaveAndGetTasks.shared.findItem(task: infoAboutTask), task : infoAboutTask)
        case .VariantView:
            VariantView(variant: infoAboutVariant, save: SaveAndGet.shared.findVariant(variant: infoAboutVariant))

      
        }
        
    }
}





enum MyPagesForNotes : String, CaseIterable, Identifiable{
    case ChooseTopicFromNotesView, NotesScrollVariantsView, NotesScrollTasksView,  TaskInfoView, VariantView
    var id: String {self.rawValue}
}
