//
//  PracticalTestPlanetsTests.swift
//  PracticalTestPlanetsTests
//
//  Created by Mukesh Verma on 20/12/18.
//  Copyright © 2018 Mukesh Verma. All rights reserved.
//

import XCTest
@testable import PracticalTestPlanets

class PracticalTestPlanetsTests: XCTestCase {

    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let objSynx = SynTaxViewController()
        
        //objSynx.printMyNameFromBidData(diccBioData: <#T##[String : String]#>)
        XCTAssertEqual("Varma Mukesh", objSynx.printFullName(firstName: "Varma", lastName: "Mukesh"))
        XCTAssertEqual("C", objSynx.printWholeName(firstName: nil, lastName: "Mukesh"))
        XCTAssertNil(objSynx.printWholeName(firstName: nil, lastName: nil))
        
        XCTAssert(objSynx.printMyNameFromBidData(diccBioData: ["name":"Mukesh","age":"27"]))
        
        XCTAssertTrue(objSynx.printMyNameFromBidData(diccBioData: ["name":"Mukesh","age":"27"]))
        
        XCTAssertGreaterThan(35, objSynx.checkMyAgeIsBelow30())
        
        
    }
    
    func testAsynchronousURLConnection() {
        let URL = NSURL(string: "https://nshipster.com/")!
        let objExpectation : XCTestExpectation = expectation(description: "GET \(URL)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: URL as URL) { data, response, error in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as? HTTPURLResponse,
                let responseURL = HTTPResponse.url,
                let MIMEType = HTTPResponse.mimeType
            {
                XCTAssertEqual(responseURL.absoluteString, URL.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(MIMEType, "text/html", "HTTP response content type should be text/html")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            objExpectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
