//
//  TaskOptionsView.swift
//  informatics
//
//  Created by Алёша Виноградов on 11.07.2023.
//

import SwiftUI

struct TaskOptionsView: View {
    @ObservedObject var coordinator : HomeCoordinator
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(){
                        ForEach(coordinator.taskOptionsForTaskOptionsView.taskOptions) { item in
                            Button {
                                coordinator.goTaskScrollView(topicName: item.NameOfTask, urlTasks: item.task)
                                
                            } label: {
                                LineForTopicNameView(text: item.NameOfTask, id: item.id)
                                    .padding(.horizontal)
                            }
                        }
                        Spacer()
                        
                    }
                    .padding(.top)
                }
                .background(Image("lengs3")
                    .resizable())
            }
            .navigationBarTitle(Text("\(coordinator.taskOptionsForTaskOptionsView.topicName)"), displayMode: .inline)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TaskOptionsView_Previews: PreviewProvider {
    @State static var coordinator = HomeCoordinator()
    static var previews: some View {
        NavigationStack{
            TaskOptionsView(coordinator: coordinator)
        }
        
    }
}
