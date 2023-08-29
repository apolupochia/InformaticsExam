//
//  NewsScrollCellView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct NewsScrollCellView: View {
    var new : New
    var body: some View {
        ZStack{
            VStack{
                Text(new.date)
                    .padding([.top], 16)
                Text(new.head)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.bottom, 16)
                    .padding(.top, 2)
            }
            .frame(minWidth: UIScreen.main.bounds.width * (90 / 100) )
            .foregroundColor(.black)
            .background(Color(hex: "#e7ffce"))
            .cornerRadius(20)
        }
        
    }
}

struct NewsScrollCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsScrollCellView(new: New(id: 0, head: "Осенние пробники", date: "1 сентября 2023 в 00:00", new: "Error"))
    }
}

