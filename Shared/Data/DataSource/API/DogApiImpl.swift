//
//  DogsApiRepository.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

struct DogAPIImpl: DogDataSource {
    
       
    func getDogs() async throws -> Dogs {
        
        guard let url = URL(string:  "\(Constants.BASE_URL)/945366962796773376") else{
            throw APIServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIServiceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode(APIEntityDogs.self, from: data) else {
            throw APIServiceError.decodingError
        }
        
        return result.map({ dog in
            Dog(
                id: UUID().uuidString,
                name: dog.dogName,
                description: dog.description,
                age: dog.age,
                image: dog.image
            )
        })
    }
}
