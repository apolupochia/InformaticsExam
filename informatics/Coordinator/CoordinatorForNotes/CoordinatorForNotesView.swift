//
//  CoordinatorForNotesView.swift
//  informatics
//
//  Created by Алёша Виноградов on 18.07.2023.
//

import SwiftUI

struct CoordinatorForNotesView: View {
    @ObservedObject var coordinator: CoordinatorForNotes
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPagesForNotes.ChooseTopicFromNotesView)
           //     .sheet(item: <#T##Binding<Identifiable?>#>, content: <#T##(Identifiable) -> View#>)
                .navigationDestination(for: MyPagesForNotes.self) { page in
                    coordinator.getPage(page)
                }
//                .onOpenURL { url in
//                    print("open url")
//                }
        }
    }
}

struct CoordinatorForNotesView_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        CoordinatorForNotesView(coordinator: coordinator.coordinatorNotes)
    }
}
