//
//  HomeCoordinatorView.swift
//  informatics
//
//  Created by Алёша Виноградов on 13.07.2023.
//

import SwiftUI

struct HomeCoordinatorView: View {

    @EnvironmentObject var coordinator : Coordinator

    var body: some View {
        NavigationStack{
            TabView(selection: $coordinator.tab) {
                
                CoordinatorForMainStudyView(coordinator: coordinator.coordinatorForMainStudy)
                    .tabItem { Label("Темы", systemImage: "homekit")}
                    .tag(HomeTab.home)
                
                CoordinatorForChooseTopicView(coordinator: coordinator.coordinatorChooseTopic)
                    .tabItem { Label("Варианты", systemImage: "pencil.slash") }
                    .tag(HomeTab.chooseTopic)
                
                CoordinatorForNotesView(coordinator: coordinator.coordinatorNotes)
                
                    .tabItem { Label("Заметки", systemImage: "star") }
                    .tag(HomeTab.notes)
            }
        }
    }
}
