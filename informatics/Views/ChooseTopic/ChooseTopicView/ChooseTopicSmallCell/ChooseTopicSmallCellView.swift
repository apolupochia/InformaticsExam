//
//  ChooseTopiCellView.swift
//  informatics
//
//  Created by Алёша Виноградов on 12.07.2023.
//

import SwiftUI

struct ChooseTopicSmallCellView: View {
    var name = "Error"
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width * (40 / 100), height: UIScreen.main.bounds.size.width * (40 / 100))
                .cornerRadius(UIScreen.main.bounds.size.width * (10 / 100))
                .foregroundColor(Color(hex: "#e98ebc"))
            Text(name)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: UIScreen.main.bounds.size.width * (35 / 100))
                .foregroundColor(.black)
        }
    }
}

struct ChooseTopicSmallCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopicSmallCellView()
    }
}
