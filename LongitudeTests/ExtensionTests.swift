//
//  ExtensionTests.swift
//  LongitudeTests
//
//  Created by Jill Allan on 05/07/2023.
//

import CoreLocation
import XCTest
@testable import Longitude

final class ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomDateGivesADateBetweenStartDateAndEndDate() throws {
        // if
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let startDate = dateFormatter.date(from: "1950-01-01") ?? Date.now
        let endDate = dateFormatter.date(from: "2023-01-01") ?? Date.now
        
        // when
        let randomDate = Date.random(in: startDate...endDate)
        
        // then
        XCTAssertTrue(
            randomDate <= endDate && randomDate >= startDate,
            "random date: \(randomDate) should be between \(startDate) and \(endDate)"
        )
    }
//    
//    func testEncodeCLLocationCoordinate2D_self_returnsData() throws {
//        // if
//        let jsonEncoder = JSONEncoder()
//        let coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.0)
//        let coordinateJSON = "{"latitude": 51.0,"longitude": 0.0}"
//        
//        // when
//        let encodedCoordinateData = try jsonEncoder.encode(coordinate)
//        let encodedJSONString = String(data: encodedCoordinateData, encoding: .utf8) ?? ""
//        
//        // then
//        XCTAssertEqual(encodedJSONString, coordinateJSON, "\(encodedJSONString) should be equal to \(coordinateJSON)")
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
