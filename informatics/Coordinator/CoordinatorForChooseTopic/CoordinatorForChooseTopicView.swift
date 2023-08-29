//
//  CoordinatorForChooseTopicView.swift
//  informatics
//
//  Created by Алёша Виноградов on 18.07.2023.
//

import SwiftUI

struct CoordinatorForChooseTopicView: View {
    @ObservedObject var coordinator: CoordinatorForChooseTopic
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPagesForChooseTopic.ChooseTopic)
           //     .sheet(item: <#T##Binding<Identifiable?>#>, content: <#T##(Identifiable) -> View#>)
                .navigationDestination(for: MyPagesForChooseTopic.self) { page in
                    coordinator.getPage(page)
                }
//                .onOpenURL { url in
//                    print("open url")
//                }
        }
    }
}

struct CoordinatorForChooseTopicView_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        CoordinatorForChooseTopicView(coordinator: coordinator.coordinatorChooseTopic)
    }
}
