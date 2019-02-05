//
//  RepositoriesDataProviderTests.swift
//  GithubAPITests
//
//  Created by Robson Moreira on 04/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import XCTest
@testable import GithubAPI

class RepositoriesDataProviderTests: XCTestCase {
    
    var dataProvider: RepositoriesDataProviderManeger?

    override func setUp() {
        dataProvider = RepositoriesDataProviderManeger()
    }

    override func tearDown() {
        dataProvider = nil
    }

    func testPerformance_GetRepositories() {
        self.measure {
            dataProvider?.getRepositories(page: 1)
        }
    }

}
