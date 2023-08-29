//
//  NotesScrollCellView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct NotesScrollCellViewForTasks: View {
    var task = Task(id: 0, numberOfTask: 0, task: "error", taskSolution: "Error", rightAnswer: "error")
    var body: some View {
       
        VStack{
            ZStack(alignment:.top){

                Text("Тип \(task.numberOfTask) № \(task.id, format: .number.grouping(.never))")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding([.top])
                    .frame(maxWidth: UIScreen.main.bounds.size.width / 1.5)
            }
            
            Text(task.task)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .padding(.bottom, 16)
                .padding(.top, 2)
                .padding(.horizontal)
        }
      //  .frame(maxWidth: UIScreen.main.bounds.size.width - 16)
        .frame(maxWidth: UIScreen.main.bounds.size.width)
        .foregroundColor(.black)
        .background(Color(hex: "#e7ffce"))
        .cornerRadius(20)
            
    }
}

struct NotesScrollCellViewForTasks_Previews: PreviewProvider {
    static var previews: some View {
        NotesScrollCellViewForTasks()
    }
}
