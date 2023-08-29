//
//  NetworkingManager.swift
//  informatics
//
//  Created by Алёша Виноградов on 21.08.2023.
//

import Foundation


final class NetworkingManager {
    
    
     func takeModelRealVariants(urlString : String, responce: @escaping ([VariantsByYear]?) -> Void) {
         guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: urlString) else { return  }
        HTTPClient().getRequest(request: request) { data, error in

             guard  let data = data else {
                 responce(nil)
                 return
             }
    
             guard let newFiles = try? JSONDecoder().decode([VariantsByYear].self, from: data) else {
                 responce(nil)
                 return
             }
           
             responce(newFiles)

         }
    }
    
    func takeModelStudyTasks(responce: @escaping ([TopicTask]?) -> Void) {
        guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: APIAdresses.tasksForStudyApi.rawValue) else { return  }
       HTTPClient().getRequest(request: request) { data, error in

            guard  let data = data else {
                responce(nil)
                return
            }
           
            guard let newFiles = try? JSONDecoder().decode([TopicTask].self, from: data) else {
                responce(nil)
                return
            }
  
            responce(newFiles)

        }
   }
    
    func takeModelStudyTask(urlString : String, responce: @escaping ([Task]?) -> Void) {
        guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: urlString) else { return  }
       HTTPClient().getRequest(request: request) { data, error in

            guard  let data = data else {
                responce(nil)
                return
            }
       
            guard let newFiles = try? JSONDecoder().decode([Task].self, from: data) else {
                responce(nil)
                return
            }
      
            responce(newFiles)

        }
   }
    
    func takeModelNews(urlString : String, responce: @escaping ([New]?) -> Void) {
        guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: urlString) else { return  }
       HTTPClient().getRequest(request: request) { data, error in

            guard  let data = data else {
                responce(nil)
                return
            }
       
            guard let newFiles = try? JSONDecoder().decode([New].self, from: data) else {
                responce(nil)
                return
            }
      
            responce(newFiles)

        }
   }
    
    
    func takeModelChooseTopic( responce: @escaping (ChooseTopicAllScroll?) -> Void) {
        guard let request : URLRequest = TakeRequest.requestForHTTP(urlString: APIAdresses.chooseTopicSecondPage.rawValue) else { return  }
       HTTPClient().getRequest(request: request) { data, error in

            guard  let data = data else {
                responce(nil)
                return
            }
       
            guard let newFiles = try? JSONDecoder().decode(ChooseTopicAllScroll.self, from: data) else {
                responce(nil)
                return
            }
      
            responce(newFiles)

        }
   }
    
    
}
