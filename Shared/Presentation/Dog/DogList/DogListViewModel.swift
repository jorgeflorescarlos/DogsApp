//
//  DogListViewModel.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

import Foundation

class DogListViewModel: ObservableObject {
    
    var getDogsUseCase: GetDogsUseCase
    @Published var dogs: Dogs = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(persistenceType: PersistenceTypes) {
        switch persistenceType {
        case .CoreData:
            getDogsUseCase =  GetDogsUseCase(remoteRepository: DogRepositoryImpl(dataSource: DogAPIImpl()), storableRepository: StorableDogRepositoryImpl(dataSource: DogDBCoreDataImpl()))
        case .Realm:
            getDogsUseCase =  GetDogsUseCase(remoteRepository: DogRepositoryImpl(dataSource: DogAPIImpl()), storableRepository: StorableDogRepositoryImpl(dataSource: DogDBRealmImpl()))
        }
    }
    
    func getDogs() async {
        errorMessage = ""
        let result = await getDogsUseCase.execute()
        switch result{
        case .success(let dogs):
            DispatchQueue.main.async {
                self.dogs = dogs
            }
        case .failure(let error):
            self.dogs = []
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}
