//
//  CoordinatorForTab.swift
//  informatics
//
//  Created by Алёша Виноградов on 18.07.2023.
//

import Foundation


//
//class CoordinatorForTab :  ObservableObject{
//
//    @Published var tabCoordinator : Tab
//    @Published var loginOrSingCoordinator : CoordinatorStart
//    @Published var loginOrMainViewCoordinator : CoordinatonStartOrMain
//    @Published var page2Coordinator : Page2IsVisible
//
//    required init(){
//        self.tabCoordinator = Tab.home
//        self.loginOrSingCoordinator = CoordinatorStart.singIn
//        self.loginOrMainViewCoordinator = CoordinatonStartOrMain.loginOrSing
//        self.page2Coordinator = Page2IsVisible.hidden
//    }
//
//
//    func crossToLoginIn(){
//        loginOrSingCoordinator = CoordinatorStart.loginIn
//    }
//
//    func crossToSingIn(){
//        loginOrSingCoordinator = CoordinatorStart.singIn
//    }
//
//    func alreadyLoginOrSing(){
//        loginOrSingCoordinator = CoordinatorStart.singIn
//    }
//
//    func crossToTab(tab : Tab){
//        tabCoordinator = tab
//    }
//
//    func crossToMainTab(){
//        loginOrMainViewCoordinator = CoordinatonStartOrMain.mainTab
//    }
//
//    func crossToLoginOrSing(){
//        loginOrMainViewCoordinator = CoordinatonStartOrMain.loginOrSing
//    }
//
//    func crossToPage2(){
//        page2Coordinator = Page2IsVisible.visible
//    }
//
//    func crossToMain(){
//        page2Coordinator = Page2IsVisible.hidden
//    }
//}
//
//
//
//
//enum CoordinatorTab {
//    case page1
//    case profile
//}
//
//enum CoordinatorStart {
//    case loginIn
//    case singIn
//}
//
//enum CoordinatonStartOrMain{
//    case loginOrSing
//    case mainTab
//}
//
//enum Page2IsVisible{
//    case visible
//    case hidden
//}
////
////
////
////
////
//
