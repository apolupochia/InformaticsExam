//
//  TaskImages.swift
//  informatics
//
//  Created by Алёша Виноградов on 19.08.2023.
//

import SwiftUI

struct TaskImages: View {
    let numberOfTask : Int
    var body: some View {
        switch numberOfTask{
        case 1:
            Image("imageTask1.1")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.6, height: UIScreen.main.bounds.size.width / 1.6)
            Image("imageTask1.2")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.6, height: UIScreen.main.bounds.size.width / 1.6)
        case 2:
            Image("imageTask2.1")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 16, height: UIScreen.main.bounds.size.width / 5)
            Image("imageTask2.2")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.6, height: UIScreen.main.bounds.size.width / 5)
            
        
        case 3:
            Image("imageTask3.1")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 16, height: UIScreen.main.bounds.size.width / 8)
            Image("imageTask3.2")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 16, height: UIScreen.main.bounds.size.width / 10)
            Image("imageTask3.3")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.6, height: UIScreen.main.bounds.size.width / 12)
            Image("imageTask3.4")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.6, height: UIScreen.main.bounds.size.width / 1.6)
        case 13:
            Image("imageTask13")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 16, height: UIScreen.main.bounds.size.width / 2)
        case 18:
            Image("imageTask18")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 2.5, height: UIScreen.main.bounds.size.width / 2)
        case 22:
            Image("imageTask22")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width / 1.3, height: UIScreen.main.bounds.size.width / 3)
        default:
            Text("")
                .padding(0)
        }
    }
}

struct TaskImages_Previews: PreviewProvider {
    static var previews: some View {
        TaskImages(numberOfTask: 1)
    }
}
