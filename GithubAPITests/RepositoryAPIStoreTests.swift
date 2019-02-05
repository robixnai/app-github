//
//  RepositoryAPIStoreTests.swift
//  GithubAPITests
//
//  Created by Robson Moreira on 04/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import XCTest
@testable import GithubAPI

class RepositoryAPIStoreTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPI_PopulateWithRequest_IsExprectedNotNil() {
        let theExpectation = expectation(description: "initialized")
        RepositoryAPIStore().getRepositories(page: 1) { (repositories, error) in
            XCTAssertNotNil(repositories, "O Array esperado de repositórios não deveria ser nil")
            theExpectation.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
