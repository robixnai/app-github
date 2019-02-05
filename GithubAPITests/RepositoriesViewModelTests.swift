//
//  RepositoriesViewModelTests.swift
//  GithubAPITests
//
//  Created by Robson Moreira on 04/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import XCTest
@testable import GithubAPI

class RepositoriesViewModelTests: XCTestCase {
    
    var repositories: Repositories?
    var viewModel: RepositoriesViewModel?

    override func setUp() {
        createMock()
        viewModel = RepositoriesViewModel(repositoryList: (repositories?.items)!)
    }

    override func tearDown() {
        repositories = nil
        viewModel = nil
    }

    private func createMock() {
        let theExpectation = expectation(description: "initialized")
        RepositoryAPIStore().getRepositories(page: 1) { (repositories, error) in
            self.repositories = repositories
            theExpectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testIntPageValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.currentPage, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testIntCountValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.countOfRepositories, "Resposta incorreta, o valor esperado não pode ser nulo")
    }
    
    func testStringUrlValue_WithValueOtherThanNil_SholdSuccess() {
        XCTAssertNotNil(viewModel?.repositoryUrl, "Resposta incorreta, o valor esperado não pode ser nulo")
    }

}
