//
//  RepositoryViewModelTests.swift
//  GithubAPITests
//
//  Created by Robson Moreira on 04/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import XCTest
@testable import GithubAPI

class RepositoryViewModelTests: XCTestCase {
    
    var repository: Repository?
    var viewModel: RepositoryViewModel?

    override func setUp() {
        createMock()
        viewModel = RepositoryViewModel(repository: repository!)
    }

    override func tearDown() {
        repository = nil
        viewModel = nil
    }
    
    private func createMock() {
        let theExpectation = expectation(description: "initialized")
        RepositoryAPIStore().getRepositories(page: 1) { (repositories, error) in
            self.repository = repositories?.items?[0]
            theExpectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }

    func testIntIdValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.id, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testImagePhotoValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.photo, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testStringRepoNameValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.repositoryName, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testIntStarValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.amountStar, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testStringAuthotNameValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.authorName, "Resposta incorreta, o valor esperado não pode ser nulo")
    }

}
