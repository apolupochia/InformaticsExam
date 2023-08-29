//
//  RealVariantsBigCellView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct VariantsChooseBigCellView: View {
    var title : String
    var body: some View {
        ZStack{
            Rectangle()
                .frame( height: UIScreen.main.bounds.size.width * (30 / 100))
                .cornerRadius(UIScreen.main.bounds.size.width * (10 / 100))
                .foregroundColor(Color(hex: "#96caff"))
            Text(title)
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: UIScreen.main.bounds.size.width * (75 / 100), maxHeight: UIScreen.main.bounds.size.width * (25 / 100))
        }
    }
}

struct VariantsChooseBigCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        VariantsChooseBigCellView(title: "2022—2023 УЧЕБНЫЙ ГОД")
    }
}
