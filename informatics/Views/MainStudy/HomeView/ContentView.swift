//
//  ContentView.swift
//  informatics
//
//  Created by Алёша Виноградов on 05.07.2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var coordinator : HomeCoordinator
    
    var body: some View {
        NavigationView {
            if (coordinator.allTasksNew != nil){
                withoutProblemWithInternet()
                    .background(Image("lengs3").resizable())
                    .navigationBarTitle(Text("Темы"), displayMode: .inline)
            } else {
                problemWithInternet()
            }
        }
    }
    
    func withoutProblemWithInternet() -> some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(coordinator.allTasksNew!) { item in
                Button {
                    coordinator.goTaskOptionsView(topicName: item.topicName,taskOptions: item.taskOptions)
                    
                } label: {
                    LineForTopicNameView(text: item.topicName, id: item.id)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
    
    func problemWithInternet() -> some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height )
      //      .navigationBarTitle(Text(""), displayMode: .inline)
    }

  
    
       
}

struct ContentView_Previews: PreviewProvider {
    @State static var coordinator = HomeCoordinator()
    static var previews: some View {
        NavigationStack{
            ContentView(coordinator: coordinator)
        }
    }
}
