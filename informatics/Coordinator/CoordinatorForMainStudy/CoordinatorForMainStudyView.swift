//
//  CoordinatorForMainStudyView.swift
//  informatics
//
//  Created by Алёша Виноградов on 18.07.2023.
//

import SwiftUI

struct CoordinatorForMainStudyView: View {
    @ObservedObject var coordinator: HomeCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPages.home)
                .navigationDestination(for: MyPages.self) { page in
                    coordinator.getPage(page)
                }
//                .onOpenURL { url in
//                    print("open url")
//                }
        }
    }
}

struct CoordinatorForMainStudyView_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        CoordinatorForMainStudyView(coordinator: coordinator.coordinatorForMainStudy)
    }
}
