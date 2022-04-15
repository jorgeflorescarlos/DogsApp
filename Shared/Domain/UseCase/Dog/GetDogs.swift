//
//  GetDogs.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

enum UseCaseError: Error{
    case networkError, decodingError
}

protocol GetDogs {
    func execute() async -> Result<Dogs, UseCaseError>
}

import Foundation


struct GetDogsUseCase: GetDogs{
    var remoteRepository: DogRepository
    var storableRepository: StorableDogRepository
    
    func execute() async -> Result<Dogs, UseCaseError>{
        do{
            let localDogs = try await storableRepository.getDogs()
            if localDogs.isEmpty {
                let dogs = try await remoteRepository.getDogs()
                try await storableRepository.saveDogs(dogs: dogs)
                return .success(dogs)
            }
            
            return .success(localDogs)
        }catch(let error){
            switch(error){
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
