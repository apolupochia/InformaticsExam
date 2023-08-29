//
//  HomeCoordinator.swift
//  informatics
//
//  Created by Алёша Виноградов on 13.07.2023.
//

import Foundation
import SwiftUI

@MainActor
class HomeCoordinator: ObservableObject {
    
    // MARK: Stored Properties
    
    @Published var path = NavigationPath()
    @Published var page : MyPages = .home
    
    
    
    @Published var allTasksNew : [TopicTask]?
    var taskOptionsForTaskOptionsView : infoForTaskOptionsView = infoForTaskOptionsView(topicName: "Error", taskOptions: [])

    @Published var tasksForTaskScrollView : infoForTaskScrollView = infoForTaskScrollView(topicName: "Error", taskOptions: nil)
    var taskInfo = Task(id: 0, numberOfTask: 0, task: "Error", taskSolution: "Error", rightAnswer: "Err")
    
    init(){
        getVariantsFromUrl()
    }

    
    func goHome(){
        path.removeLast(path.count)
    }
    
    func goTaskOptionsView(topicName : String, taskOptions : [TaskOptions]){
        taskOptionsForTaskOptionsView.taskOptions = taskOptions
        taskOptionsForTaskOptionsView.topicName = topicName
        path.append(MyPages.TaskOptionsView)
    }
    
    func goTaskScrollView(topicName : String, urlTasks : String){
        tasksForTaskScrollView.taskOptions = nil
        getTasks(urlString: urlTasks)
        tasksForTaskScrollView.topicName = topicName
        path.append(MyPages.scrollView)
        
    }
    
    func goTaskInfoView(task : Task){
        taskInfo = task
        path.append(MyPages.taskInfoView)
    }
    
    
    func getTasks(urlString : String){
        NetworkingManager().takeModelStudyTask(urlString : urlString) { tasks in
            DispatchQueue.main.async {
                self.tasksForTaskScrollView.taskOptions = tasks!
            }
        }
    }
    
    
    func getVariantsFromUrl(){
        NetworkingManager().takeModelStudyTasks { topicTasks in
            DispatchQueue.main.async {
                self.allTasksNew = topicTasks
            }
        }
    }
    
    @ViewBuilder
    func getPage(_ page : MyPages) -> some View{
        switch page{
        case .home:
            ContentView(coordinator: self)
        case .TaskOptionsView:
            TaskOptionsView(coordinator: self)
        case .scrollView:
            TaskScrollView(coordinator: self)
        case .taskInfoView:
            TaskInfoView(save: SaveAndGetTasks.shared.findItem(task: taskInfo), task : taskInfo)
        }
        
    }
}



enum MyPages : String, CaseIterable, Identifiable{
    case home, TaskOptionsView, scrollView, taskInfoView
    var id: String {self.rawValue}
}






