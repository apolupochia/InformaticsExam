//
//  ChooseTopicFromNotesView.swift
//  informatics
//
//  Created by Алёша Виноградов on 14.08.2023.
//

enum kkk {
    case variants
    case tasks
}


import SwiftUI

struct ChooseTopicFromNotesView: View {
    @ObservedObject var coordinator : CoordinatorForNotes
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Button {
                        coordinator.goChooseVariantsView()
                    } label: {
                        ChooseTopicBigCellView(name : "Сохранённые Варивнты")
                    }
                    
                    Button {
                        coordinator.goChooseTasksView()
                    } label: {
                        ChooseTopicBigCellView(name : "Сохранённые Задания")
                    }
                }
                .padding(.vertical)
 
            }
           
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Image("lengs3").resizable())
            .navigationBarTitle(
                Text("Заметки"), displayMode: .inline
            )
        }
    }
}

struct ChooseTopicFromNotesView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopicFromNotesView(coordinator: CoordinatorForNotes())
    }
}
