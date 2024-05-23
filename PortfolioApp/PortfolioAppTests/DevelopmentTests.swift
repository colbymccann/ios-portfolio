//
//  DevelopmentTests.swift
//  PortfolioAppTests
//
//  Created by Colby McCann on 5/22/24.
//

import XCTest
import CoreData
@testable import PortfolioApp

final class DevelopmentTests: BaseTestCase {

    func testSampleDataCreationWorks() {
        dataController.createSampleData()

        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 5, "There should be 5 sample tags.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 50, "There should be 50 sample issues.")
    }

    func testDeleteAllWorks() {
        dataController.createSampleData()
        dataController.deleteAll()

        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 0, "There should be no tags.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 0, "There should be no issues.")
    }

    func testNewTagLacksIssues() throws {
        let myTag = Tag.example
        XCTAssertEqual(myTag.issues?.count, 0)
    }

    func testNewIssueIsHighPriority() throws {
        let myIssue = Issue.example
        XCTAssertEqual(myIssue.priority, 2)
    }

}
