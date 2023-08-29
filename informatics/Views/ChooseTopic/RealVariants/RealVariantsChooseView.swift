//
//  RealVariantsView.swift
//  informatics
//
//  Created by Алёша Виноградов on 13.07.2023.
//

import SwiftUI

struct RealVariantsChooseView: View {
    @ObservedObject var coordinator: CoordinatorForChooseTopic
    let taskOptions : [TaskOptions] = [TaskOptions(id: 0, quantityOfTasks: 0, NameOfTask: "", task: "")]
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            
            if (coordinator.variantsNew != nil) {
                withoutProblemWithInternet()
            } else {
                problemWithInternet()
            }
        }
        .navigationBarTitle(Text("Варианты"), displayMode: .inline)
    }
    
    
    
    func withoutProblemWithInternet() -> some View{
        ScrollView(.vertical, showsIndicators: false) {
    
            ForEach(coordinator.variantsNew!) { award in
                VariantsChooseBigCellView(title: "\(award.year)")
                ForEach(award.InfoAboutVariant) { award1 in
                    Button {
                        
                        coordinator.goVariantView(variant: award1)
                    } label: {
                        VariantsChooseSmallCellView(title: award1.variantName)
                    }

                }
            }
            .padding(.horizontal)
           
        }
    }
    
    func problemWithInternet() -> some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height )
    }
}

struct RealVariantsChooseView_Previews: PreviewProvider {
    @State static var coordinator = CoordinatorForChooseTopic()
    static var previews: some View {
        RealVariantsChooseView(coordinator: coordinator)
    }
}
