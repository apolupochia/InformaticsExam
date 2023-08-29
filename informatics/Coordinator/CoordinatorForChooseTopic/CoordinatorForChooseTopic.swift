//
//  CoordinatorForChooseTopic.swift
//  informatics
//
//  Created by Алёша Виноградов on 18.07.2023.
//


import Foundation
import SwiftUI

@MainActor
class CoordinatorForChooseTopic: ObservableObject {
    
    // MARK: Stored Properties
    
    @Published var tab = HomeTab.home
    
    @Published var path = NavigationPath()
    @Published var page : MyPagesForChooseTopic = .ChooseTopic
    
    
    @Published var chooseTopicAllScroll : ChooseTopicAllScroll?
    
    @Published var variantsNew : [VariantsByYear]?
    var variantInfo = InfoAboutVariant(id: 0, variantName: "error", variantNamber: 0, variant: [Task(id: 0, numberOfTask: 0, task: "error", taskSolution: "Error", rightAnswer: "error")])
    @Published var news : [New]?
    var new = New(id: 0, head: "Error", date: "Error", new: "Error")
   
    init(){
        getChooseTopicModel()
    }
    
    func goHome(){
        path.removeLast(path.count)
    }
    
    func goNewsScrollView(urlString : String){
        news = nil
        getNewsFromUrl(urlString: urlString)
        path.append(MyPagesForChooseTopic.NewsScrollView)
    }
    
    func goNewInfo(new : New){
        self.new = new
        path.append(MyPagesForChooseTopic.NewInfo)
    }
    
    func goRealVariants(urlString : String){
        variantsNew = nil
        getVariantsFromUrl(urlString: urlString)
        path.append(MyPagesForChooseTopic.RealVariants)

    }
    
    func goVariantView(variant : InfoAboutVariant){
        variantInfo = variant
        path.append(MyPagesForChooseTopic.VariantView)
    }
    

    func getNewsFromUrl(urlString : String){
        
        NetworkingManager().takeModelNews(urlString : urlString) { news in
            DispatchQueue.main.async {
                self.news = news
            }
        }
    }

    func getVariantsFromUrl(urlString : String){
        NetworkingManager().takeModelRealVariants(urlString: urlString) { variantsFromUrl in
            DispatchQueue.main.async {
                self.variantsNew = variantsFromUrl
            }
        }
    }
    
    func getChooseTopicModel(){
        NetworkingManager().takeModelChooseTopic { chooseTopicAllScroll in
            DispatchQueue.main.async {
                self.chooseTopicAllScroll = chooseTopicAllScroll
            }
        }
    }

    
    @ViewBuilder
    func getPage(_ page : MyPagesForChooseTopic) -> some View{
        switch page{
        case .ChooseTopic:
            ChooseTopic(coordinator: self)
        case .NewsScrollView:
            NewsScrollView(coordinator: self)
        case .NewInfo:
            NewInfoView(new: new)
        case .RealVariants:
            RealVariantsChooseView(coordinator: self)
        case .VariantView:
            VariantView(variant: variantInfo, save: SaveAndGet.shared.findVariant(variant: variantInfo))
        }
        
    }
}




enum MyPagesForChooseTopic : String, CaseIterable, Identifiable{
    case ChooseTopic, NewsScrollView, NewInfo,  RealVariants, VariantView
    var id: String {self.rawValue}
}
