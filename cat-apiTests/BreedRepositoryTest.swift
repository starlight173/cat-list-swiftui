//
//  BreedRepositoryTest.swift
//  cat-apiTests
//
//  Created by Quang Luu on 08/08/2023.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift

@testable import cat_api

final class BreedRepositoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_fetch_breeds_success() async throws {
        let exp = expectation(description: "Response success")
        let repo = BreedRepositoryImp()
        stub(condition: isHost("api.thecatapi.com")) { _ in
            let path: String! = OHPathForFile("sample.json", type(of: self))
            return HTTPStubsResponse(fileAtPath: path, statusCode: 200, headers: nil)
        }
        
        let result = try await repo.fetchBreeds()
        
        XCTAssertEqual(result.count, 5)
        
        exp.fulfill()
        
        await waitForExpectations(timeout: 1)
        
        HTTPStubs.removeAllStubs()
    }

}
