//
//  ChooseTopic.swift
//  informatics
//
//  Created by Алёша Виноградов on 12.07.2023.
//



import SwiftUI

struct ChooseTopic: View {
    @ObservedObject var coordinator: CoordinatorForChooseTopic
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            
            if (coordinator.chooseTopicAllScroll?.firstScroll != nil || coordinator.chooseTopicAllScroll?.secondScroll != nil){
                withoutProblemWithInternet()
                    .background(Image("lengs3").resizable())
                    .navigationBarTitle(Text("Варианты"), displayMode: .inline)
            } else {
                problemWithInternet()
                    .navigationBarTitle(Text("Варианты"), displayMode: .inline)
            }
        }
    }
    
    func withoutProblemWithInternet() -> some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            if (coordinator.chooseTopicAllScroll?.firstScroll != nil){
                ForEach(coordinator.chooseTopicAllScroll!.firstScroll) { award in
                    Button {
                        coordinator.goRealVariants(urlString: award.urlString)
                    } label: {
                        ChooseTopicBigCellView(name: award.name)
                            .padding(.vertical)
                    }
                }
            }
            
            if (coordinator.chooseTopicAllScroll?.secondScroll != nil){
                LazyVGrid(columns: columns) {
                    ForEach(coordinator.chooseTopicAllScroll!.secondScroll) { award in
                        VStack {
                            Button {
                                coordinator.goNewsScrollView(urlString: award.urlString)
                            } label: {
                                ChooseTopicSmallCellView(name: award.name)
                            }
                        }
                    }
                }
            }
            
        }
    }
    
    func problemWithInternet() -> some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height )
    }
    
    

    
    func contentSmallButton( page : AllChooseSmallButton) -> some View{
        switch page  {
        case .news:
            return ChooseTopicSmallCellView(name: page.rawValue)
 //       case .real:
   //         return ChooseTopicSmallCellView(name: page.rawValue)
        case .help:
            return ChooseTopicSmallCellView(name: page.rawValue)
        }
    }
    
    func contentBigButton( page : AllChooseBigButton) -> some View{
        switch page  {
        case .realVariants:
            return ChooseTopicBigCellView(name: page.rawValue)
        case .autumnVariant:
            return ChooseTopicBigCellView(name: page.rawValue)
            
        }
    }
}

struct ChooseTopic_Previews: PreviewProvider {
    @State static var coordinator = HomeCoordinator()
    static var previews: some View {
        NavigationStack{
            ChooseTopic(coordinator: CoordinatorForChooseTopic())
                .environmentObject(coordinator)
        }
    }
}

enum AllChooseBigButton: String, RawRepresentable, CaseIterable, Identifiable {
    //case real = "Реальные варианты"
    case realVariants = "Реальные Варианты ЕГЭ"
    case autumnVariant = "Осенние варианты ЕГЭ"
    
    var id: String { self.rawValue }
}

enum AllChooseSmallButton: String, RawRepresentable, CaseIterable, Identifiable {
    //case real = "Реальные варианты"
    case news = "Новости"
    case help = "Помощь"
//    case PressurePainDetectionThreshold = "Pressure Pain Detection Threshold"
//    case ColdHypersensitivity = "Cold Hypersensitivity"
//    case S_LANSS = "S-LANSS"
//    case DN4Questionnaire = "DN4 Questionnaire"
//    case CentralSensitivityInventory = "Central Sensitivity Inventory"
//    case PCS = "PCS"
//    case TSK = "TSK"
//    case PainSelf_EfficacyQuestionnaire = "Pain Self-Efficacy Questionnaire"
//    case TraumaticInjuriesDistressScale = "Traumatic Injuries Distress Scale"
//    case PatientHealthQuestionnaire9 = "Patient Health Questionnaire - 9"
//    case HADS = "HADS"
//    case PTSDChecklist_CivilianVersion = "PTSD Checklist - Civilian Version"

    //computed property to get name, which is just the case's rawValue
//    var name: String { self.rawValue }
//
    //Identifiable so we can use in ForEach
    var id: String { self.rawValue }

//    computed property to return the value, if any, a Section header should
//    have for each case
    var headerTitle: String? {
        //return the desired header text for sections that get headers
        switch self {
        case .news:
            return "ChooseTopicSmallCellView()"
        //case .real:
          //  return "ChooseTopicSmallCellView()"
//        case .PressurePainDetectionThreshold:
//            return "Nociceptive/Physiological"
//        case .ColdHypersensitivity:
//            return "Peripheral Neuropathic"
//        case .CentralSensitivityInventory:
//            return "Central Nociplastic"
//        case .PCS:
//            return "Cognitive"
//        case .TraumaticInjuriesDistressScale:
//            return "Emotional"
        //and return nil for those that don't get a section header
//        default:
//            return nil
        case .help:
            return "ChooseTopicSmallCellView()"
        }
    }

    @ViewBuilder
     func getPage( page : AllChooseSmallButton) -> some View{
         switch page  {
         case .news:
             ChooseTopicSmallCellView()
      //   case .real:
        //     ChooseTopicSmallCellView()
         case .help:
             ChooseTopicSmallCellView()
         }
//        case .PressurePainDetectionThreshold:
//            ChooseTopicSmallCellView()
//        case .ColdHypersensitivity:
//            ChooseTopicSmallCellView()
//        case .S_LANSS:
//            ChooseTopicSmallCellView()
//        case .DN4Questionnaire:
//            ChooseTopicSmallCellView()
//        case .CentralSensitivityInventory:
//            ChooseTopicSmallCellView()
//        case .PCS:
//            ChooseTopicSmallCellView()
//        case .TSK:
//            ChooseTopicSmallCellView()
//        case .PainSelf_EfficacyQuestionnaire:
//            ChooseTopicSmallCellView()
//        case .TraumaticInjuriesDistressScale:
//            ChooseTopicSmallCellView()
//        case .PatientHealthQuestionnaire9:
//            ChooseTopicSmallCellView()
//        case .HADS:
//            ChooseTopicSmallCellView()
//        case .PTSDChecklist_CivilianVersion:
//            ChooseTopicSmallCellView()


    }
}
