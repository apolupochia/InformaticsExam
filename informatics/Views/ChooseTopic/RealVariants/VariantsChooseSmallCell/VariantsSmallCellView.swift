//
//  VariantsSmallCellView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct VariantsChooseSmallCellView: View {
    let title : String
    var body: some View {
        ZStack{
            Rectangle()
                .frame( height: UIScreen.main.bounds.size.width * (20 / 100))
                .cornerRadius(UIScreen.main.bounds.size.width * (10 / 100))
                .foregroundColor(Color(hex: "#eeffa5"))
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: UIScreen.main.bounds.size.width * (75 / 100))
        }
        .padding(.horizontal)
    }
}

struct VariantsChooseSmallCellView_Previews: PreviewProvider {
    static var previews: some View {
        VariantsChooseSmallCellView(title: "Демонстрационная версия")
    }
}
