//
//  LongitudeUITests.swift
//  LongitudeUITests
//
//  Created by Jill Allan on 30/06/2023.
//

import XCTest
//@testable import Longitude

final class LongitudeUITests: BaseUITestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddingTrip_OpensTripViewWithTripTitle() throws {
        let randomDateRangeStartDate = Calendar.current.date(byAdding: .year, value: -10, to: Date.now) ?? Date.now
        let startDate = Date.random(in: randomDateRangeStartDate...Date.now)
        let endDate = Date.random(in: startDate...Date.now)
        
        app.tabBars["Tab Bar"].buttons["Trips"].tap()
        
        let title = String.random(length: 10)
        
        app.navigationBars["Trips"].buttons["Add Trip"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.textFields["Trip Title"]/*[[".cells.textFields[\"Trip Title\"]",".textFields[\"Trip Title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.typeText(title)
      
        app.datePickers.buttons.element(boundBy: 0).tap()
        pickDate(date: startDate)
        
        app.datePickers.buttons.element(boundBy: 1).tap()
        pickDate(date: endDate)
        
        app.buttons["Save"].tap()
        
        let newTripTitleExists = app.navigationBars.staticTexts[title].exists
        print(newTripTitleExists)
        
        XCTAssertTrue(newTripTitleExists)

    }
    
   
    
    func pickDate(date: Date) {
        XCTContext.runActivity(named: "Pick Date") { activity in
            app.buttons["Show year picker"].tap()
            
            // Adjust the month
            app.datePickers.pickerWheels[
                Date.now.formatted(Date.FormatStyle().month(.wide))
            ].adjust(
                toPickerWheelValue: date.formatted(Date.FormatStyle().month(.wide))
            )
            
            // Adjust the year
            app.datePickers.pickerWheels[
                Date.now.formatted(Date.FormatStyle().year(.defaultDigits))
            ].adjust(
                toPickerWheelValue: date.formatted(Date.FormatStyle().year(.defaultDigits))
            )
            
            // Back to the day view and select the day
            app.buttons["Hide year picker"].tap()
            app.datePickers.buttons[
                date.formatted(Date.FormatStyle().month(.wide).day(.defaultDigits).weekday(.wide))
            ].tap()
            
            app/*@START_MENU_TOKEN@*/.buttons["dismiss popup"]/*[[".buttons[\"dismiss popup\"]",".buttons[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension Date {
    static func random(in range: ClosedRange<Date>) -> Date {
        let span = TimeInterval.random(
            in: range.lowerBound.timeIntervalSinceNow...range.upperBound.timeIntervalSinceNow
        )
        let date = Date(timeIntervalSinceNow: span)
        print(date)
        return date
    }
}

extension String {
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
