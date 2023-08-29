//
//  Coordinator.swift
//  informatics
//
//  Created by Алёша Виноградов on 05.07.2023.
//

import Foundation

@MainActor
class Coordinator : ObservableObject{
    
    @Published var tab = HomeTab.home
    
    @Published var coordinatorForMainStudy = HomeCoordinator()
    @Published var coordinatorChooseTopic = CoordinatorForChooseTopic()
    @Published var coordinatorNotes = CoordinatorForNotes()
    
//    init(){
//   //     self.coordinatorForMainStudy = HomeCoordinator()
//        self.coordinatorChooseTopic = CoordinatorForChooseTopic()
//        self.coordinatorNotes = CoordinatorForNotes()
//    }
    
    
}

enum HomeTab: String {

    case home
    case chooseTopic
    case notes

}

