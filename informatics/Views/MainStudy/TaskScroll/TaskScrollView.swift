//
//  TaskScrollView.swift
//  informatics
//
//  Created by Алёша Виноградов on 12.07.2023.
//

import SwiftUI

struct TaskScrollView: View {
    @ObservedObject var coordinator : HomeCoordinator

    
    var body: some View {
        
        if (coordinator.tasksForTaskScrollView.taskOptions != nil){
            withoutProblemWithInternet()
           // problemWithInternet()
                .background(Image("lengs3")
                .resizable())
                .navigationBarTitle(Text(coordinator.tasksForTaskScrollView.topicName), displayMode: .inline)
                .edgesIgnoringSafeArea(.bottom)
        } else {
            problemWithInternet()
                .background(Image("lengs3")
                .resizable())
                .navigationBarTitle(Text(coordinator.tasksForTaskScrollView.topicName), displayMode: .inline)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    func withoutProblemWithInternet() -> some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(){
                ForEach(coordinator.tasksForTaskScrollView.taskOptions!) { item in
                    Button {
                        coordinator.goTaskInfoView(task: item)
                            
                    } label: {
                        TaskScrollRow(id: item.id, task: item.task)
                                .frame(width: UIScreen.main.bounds.width)
                            
                    }
                        
                }
            }
            .padding(.top)
            
        }
    }
    
    func problemWithInternet() -> some View{
        GeometryReader{ i in
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height - i.safeAreaInsets.top)
                .navigationBarTitle(Text("Темы"), displayMode: .inline)
        }
    }
}

struct TaskScrollView_Previews: PreviewProvider {
    @State static var coordinator = HomeCoordinator()
    static var previews: some View {
        NavigationStack{
            TaskScrollView(coordinator: coordinator)
                //    .environmentObject(coordinator)
        }
    }
}
