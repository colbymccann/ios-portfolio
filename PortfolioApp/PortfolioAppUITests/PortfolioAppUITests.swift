//
//  PortfolioAppUITests.swift
//  PortfolioAppUITests
//
//  Created by Colby McCann on 5/23/24.
//

import XCTest

extension XCUIElement {
    func clear() {
        guard let stringValue = self.value as? String else {
            XCTFail("Failed to clear text in XCUIElement")
            return
        }
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        typeText(deleteString)
    }

}

final class PortfolioAppUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }

    func testAppStartsWithNavigationBar() throws {
        XCTAssertTrue(app.navigationBars.element.exists)
    }

    func testAppHasBasicButtonsOnLaunch() throws {
        XCTAssertTrue(app.navigationBars.buttons["Filters"].exists)
        XCTAssertTrue(app.navigationBars.buttons["Filter"].exists)
        XCTAssertTrue(app.navigationBars.buttons["New Issue"].exists)
    }

    func testNoIssuesAtStart() throws {
        XCTAssertEqual(app.cells.count, 0)
    }

    func testCreatingAndDeletingIsues() throws {
        for tapCount in 1...5 {
            app.buttons["New Issue"].tap()
            app.buttons["Issues"].tap()

            XCTAssertEqual(app.cells.count, tapCount)
        }

        for tapCount in (0...4).reversed() {
            app.cells.firstMatch.swipeLeft()
            app.buttons["Delete"].tap()

            XCTAssertEqual(app.cells.count, tapCount)
        }
    }

    func testEditingIssueTitleUpdatesCorrectly() throws {
        XCTAssertEqual(app.cells.count, 0)

        app.buttons["New Issue"].tap()

        app.textFields["Enter the issue title here"].tap()

        app.textFields["Enter the issue title here"].clear()
        app.typeText("My New Issue")

        app.buttons["Issues"].tap()
        XCTAssertTrue(app.buttons["My New Issue"].exists)
    }

    func testEditingIssuesPriorityShowsIcon() throws {
        app.buttons["New Issue"].tap()
        app.buttons["Priority, Medium"].tap()
        app.buttons["High"].tap()
        app.buttons["Issues"].tap()

        let identifier = "New issue High Priority"
        XCTAssert(app.images[identifier].exists)
    }

    func testAllAwardsShowLockedAlert() throws {
        app.buttons["Filters"].tap()
        app.buttons["Show awards"].tap()

        for award in app.scrollViews.buttons.allElementsBoundByIndex {
            if app.windows.firstMatch.frame.contains(award.frame) == false {
                app.swipeUp()
            }
            award.tap()
            XCTAssertTrue(app.alerts["Locked"].exists)
            app.buttons["OK"].tap()
        }
    }
}
