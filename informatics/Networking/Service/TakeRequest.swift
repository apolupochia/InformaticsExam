//
//  TakeRequest.swift
//  informatics
//
//  Created by Алёша Виноградов on 22.08.2023.
//

import Foundation

final class TakeRequest{
    static func requestForHTTP(urlString : String) -> URLRequest? {
        guard var url = URL(string: urlString) else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
