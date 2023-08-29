//
//  TaskInfoView.swift
//  informatics
//
//  Created by Алёша Виноградов on 12.07.2023.
//

import SwiftUI

struct TaskInfoView: View {
//    @ObservedObject var coordinator : HomeCoordinator
    @State var save : Bool
    @State var hideAnswer = true
    @State var solvingTask = true
    var task =  Task(id: 0, numberOfTask: 0, task: "ERROR", taskSolution: "Error", rightAnswer: "ERROR")
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
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
        
        .navigationBarTitle(Text("Задание № \(task.numberOfTask)"), displayMode: .inline)
        .navigationBarItems( trailing:
            Button(action: {
            if save{
                SaveAndGetTasks.shared.deleteItem(task: task)
            } else {
                SaveAndGetTasks.shared.saveTask(task: task)
            }
                save.toggle()
               
            }, label: {
                Image(systemName: "star.fill")
                    .foregroundColor(save == false ? .gray : .yellow)
            })
                               
        )
        }
}

struct TaskInfoView_Previews: PreviewProvider {
    @State static var coordinator = HomeCoordinator()
    static var previews: some View {
        NavigationStack{
            TaskInfoView(save: false)
              //  .environmentObject(coordinator)
        }
    }
}


let answer = "\nvar\nx, y: longint;\nn: longint;\nsum: longint;\nmindif: longint;\nf: text;\nbegin\n\tassign(f,'C:27-A.txt');\n\treset(f);\n\treadln(f, n);\n\tsum := 0;\n\tmindif := 20001;\n\twhile not eof(f) do begin\n\t\treadln(f, x, y);\n\t\tif x > y then\n\t\t\tsum := sum + x\n\t\telse\n\t\t\tsum := sum + y;\n\t\tif (abs(x - y) < mindif) and (abs(x-y) mod 3 <> 0) then mindif := abs(x-y);\n\t\tend;\n\t\tif sum mod 3 <> 0 then\n\t\t\twriteln(sum)\n\t\telse\n\t\t\twriteln(sum - mindif);\nend."


