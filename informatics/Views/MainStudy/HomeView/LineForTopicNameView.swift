//
//  LineForTopicNameView.swift
//  informatics
//
//  Created by Алёша Виноградов on 11.07.2023.
//

import SwiftUI

struct LineForTopicNameView: View {
    let text : String
    let id : Int
    var body: some View {
        ZStack{
            HStack {
                Rectangle()
                    .frame( height: UIScreen.main.bounds.size.height / 15)
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
            }
            
            Text("\(id). \(text)")
                .font(.callout)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: UIScreen.main.bounds.size.width / 1.1, height: UIScreen.main.bounds.size.height / 15)
        }
    }
}

struct LineForTopicNameView_Previews: PreviewProvider {
    static var previews: some View {
        LineForTopicNameView(text: "choiseItems", id : 0)
    }
}

