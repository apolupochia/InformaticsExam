//
//  NotesScroll.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct NotesScrollVariantsView: View {
    @ObservedObject var coordinator : CoordinatorForNotes
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Variants>
    
    
    var body: some View {
        NavigationView {
    
            ScrollView(.vertical, showsIndicators: false){
                ForEach(items) { item in
                    Button {
                        coordinator.goVariantView(
                            variant: getInfoAboutVariantFromData.shared.getItems(data: item.variant)
                        )
                    } label: {
                        NotesScrollCellViewForVariant(variant: getInfoAboutVariantFromData.shared.getItems(data: item.variant))
                          //  .padding(.horizontal)
                    }
                    
                    
                }
                .padding(.vertical)
            }

        }
        
        .navigationBarTitle(
            Text("Варианты"), displayMode: .inline
        )
    }
}

struct NotesScrollVariantsView_Previews: PreviewProvider {
    static var previews: some View {
        NotesScrollVariantsView(coordinator: CoordinatorForNotes())
    }
}
