//
//  NewInfoView.swift
//  informatics
//
//  Created by Алёша Виноградов on 17.07.2023.
//

import SwiftUI

struct NewInfoView: View {
    let new : New
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Text(new.head)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(new.date)
                .padding(.top)
                .font(.subheadline)
            Text(new.new)
            
                .padding(.top, 20)

            
//
//            .frame(minWidth: UIScreen.main.bounds.width / 2)
//            .foregroundColor(.black)
//            .background(Color(hex: "e5e8ef"))
//            .cornerRadius(20)
            
            
        }
        .padding()
  //      .navigationBarTitle(Text("tyt").font(.subheadline), displayMode: .inline)
    
    }
}

struct NewInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NewInfoView(new: New(id: 0, head: "Error", date: "Error", new: "Error"))
    }
}
