//
//  Variant.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct VariantCellView: View {
    @State var hideAnswer = true
    @State var solvingTask = true
    let task : Task
    var body: some View {

            ScrollView(.vertical, showsIndicators: false){
                Text("№ \(String(task.numberOfTask))")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                Text(task.task)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                TaskImages(numberOfTask: task.numberOfTask)
                
                Text("Ответ : ")
                    .padding(.top, 20)
                
                Button {
                    hideAnswer.toggle()
                } label: {
                    if hideAnswer{
                        Text("tap here")
                            .multilineTextAlignment(.leading)
                            .padding(8)
                    } else {
                        Text(task.rightAnswer)
                            .multilineTextAlignment(.leading)
                            .padding(8)
                    }
                }
                
                
                .frame(minWidth: UIScreen.main.bounds.width / 2)
                .foregroundColor(.black)
                .background(Color(hex: "e5e8ef"))
                .cornerRadius(20)
                
                Text("Решение")
                    .padding(.top)
                Button {
                    solvingTask.toggle()
                } label: {
                    if solvingTask{
                        Text("tap here")
                            .multilineTextAlignment(.leading)
                            .padding(8)
                    } else {
                        Text(task.taskSolution)
                            .multilineTextAlignment(.leading)
                            .padding(8)
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width / 2)
                .foregroundColor(.black)
                .background(Color(hex: "e5e8ef"))
                .cornerRadius(20)
                
                
            }
    }
}

struct VariantCellView_Previews: PreviewProvider {
    static var previews: some View {
        VariantCellView( task: Task(id: 3, numberOfTask: 0, task: "12", taskSolution: "", rightAnswer: "21"))
    }
}
