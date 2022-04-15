//
//  APICall.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

enum APIServiceError: Error{
    case badUrl, requestError, decodingError, statusNotOK
}

enum DBServiceError: Error{
    case readDrror, writeError
}

struct Constants {
    static let BASE_URL = "https://jsonblob.com/api"
    
    struct Colors {
        static let mainColor = "#666666"
        static let secondColor = "#333333"
        static let thirdColor = "#F8F8F8"
    }
}
