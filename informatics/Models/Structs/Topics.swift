//
//  Topics.swift
//  informatics
//
//  Created by Алёша Виноградов on 11.07.2023.
//

import Foundation



// MARK: - infoForTaskOptionsView

struct infoForTaskOptionsView{
    var topicName : String
    var taskOptions : [TaskOptions]
}

struct infoForTaskScrollView{
    var topicName : String
    var taskOptions : [Task]?
}


// MARK: - ChooseTopicAllScroll

struct ChooseTopicAllScroll : Codable {
    let firstScroll : [ChooseTopicFirstScroll]
    let secondScroll : [ChooseTopicSecondScroll]
}

struct ChooseTopicFirstScroll : Identifiable, Codable {
    var id: Int
    let name : String
    let urlString : String
}

struct ChooseTopicSecondScroll : Identifiable, Codable {
    var id: Int
    let name : String
    let urlString : String
}


// MARK: - News

struct New : Identifiable, Codable{
    let id : Int
    let head : String
    let date : String
    let new : String
}



// MARK: - TasksForStudy

struct TopicTask : Identifiable, Codable{
    var id: Int
    let topicName: String
    let taskOptions : [TaskOptions]
}


struct TaskOptions : Identifiable , Codable{
    var id: Int
    let quantityOfTasks : Int
    let NameOfTask : String
    let task : String
  //  let task : [Task]
    
}




// MARK: - RealVariants

struct VariantsFromURL: Codable {
    let variantsByYear: [VariantsByYear]
}

struct VariantsByYear: Identifiable, Codable {
    let id : Int
    let year: Int
    let InfoAboutVariant: [InfoAboutVariant]
}

struct InfoAboutVariant : Identifiable, Codable{
    let id : Int
    let variantName : String
    let variantNamber : Int
    let variant : [Task]
}



// MARK: - Task

struct Task : Identifiable, Codable{
    var id : Int
    let numberOfTask : Int
    let task : String
    let taskSolution : String
    let rightAnswer : String
    
}












