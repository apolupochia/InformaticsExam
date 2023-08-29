//
//  VariantView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct VariantView: View {
    var variant : InfoAboutVariant
    @State var save : Bool
    var body: some View {
        NavigationView {
            
            
            ScrollView(.vertical, showsIndicators: false){
                ForEach(variant.variant) { item in
                    VariantCellView(task : item)
                }
                .padding(.vertical)
            }
            
        }
        .navigationBarItems( trailing:
            Button(action: {
            if save{
                SaveAndGet.shared.deleteItem(variant: variant)
            } else {
                SaveAndGet.shared.saveTask(variant: variant)
            }
                save.toggle()

            }, label: {
                Image(systemName: "star.fill")
                    .foregroundColor(save == false ? .gray : .yellow)
            })

        )
    }
}

struct VariantView_Previews: PreviewProvider {
    static var previews: some View {
        VariantView(variant: InfoAboutVariant(id: 0, variantName: "756", variantNamber: 0, variant: []), save: true)
    }
}
