//
//  NotesScrollCellViewForVariant.swift
//  informatics
//
//  Created by Алёша Виноградов on 16.08.2023.
//

import SwiftUI

struct NotesScrollCellViewForVariant: View {
    var variant = InfoAboutVariant(id: 0, variantName: "Error", variantNamber: 0, variant: [Task(id: 0, numberOfTask: 0, task: "Error", taskSolution: "Error", rightAnswer: "Error")])
    var body: some View {
        
        VStack{
            Text(variant.variantName != "" ? variant.variantName : "Вариант № \(variant.variantNamber)")
                .font(.title3)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding([.top])
                .frame(maxWidth: UIScreen.main.bounds.size.width / 1.5)
            
            Text("")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .padding(.bottom, 16)
                .padding(.top, 2)
                .padding(.horizontal)
        }
        
        .frame(maxWidth: UIScreen.main.bounds.size.width - 16)

        .foregroundColor(.black)
        .background(Color(hex: "#e7ffce"))
        
        .cornerRadius(20)
   
    }
}

struct NotesScrollCellViewForVariant_Previews: PreviewProvider {
    static var previews: some View {
        NotesScrollCellViewForVariant()
    }
}

