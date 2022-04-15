//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Jorge Flores Carlos on 11/04/22.
//

import XCTest

class Tests_iOS: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testApiResult() async throws{
        
        let fakeDataSource = FakeDogAPIImpl()
        
        let dogRepository = DogRepositoryImpl(dataSource: fakeDataSource)
        
        let dogs = try? await dogRepository.getDogs()
        
        XCTAssertEqual(dogs!.count, 1, "Unexpected result size")
    }
    
    struct FakeDogAPIImpl: DogDataSource {
        func getDogs() async throws -> Dogs {
            [Dog(
                id: UUID().uuidString,
                name: "max",
                description: "my fav dog",
                age: 2,
                image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=640:*"
            )]
        }
    }
}
