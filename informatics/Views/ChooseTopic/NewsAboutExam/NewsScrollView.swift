//
//  NewsScrollView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct NewsScrollView: View {
    @ObservedObject var coordinator: CoordinatorForChooseTopic
    var body: some View {
        
        NavigationView {
            if (coordinator.news != nil){
                withoutProblemWithInternet()
            } else {
                problemWithInternet()
            }
        }
        .navigationBarTitle(Text("Новости"), displayMode: .inline)
    }
    
    
    func withoutProblemWithInternet() -> some View{
        ScrollView(.vertical, showsIndicators: false) {
    
            ForEach(coordinator.news!) { award in
                Button {
                    coordinator.goNewInfo(new : award)
                } label: {
                    NewsScrollCellView(new: award)
                        .padding(.horizontal)
                }
            }
            .padding()
           
        }
    }
    
    func problemWithInternet() -> some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height )
    }
}

struct NewsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NewsScrollView(coordinator: CoordinatorForChooseTopic())
    }
}
