//
//  URLSessionOperationTests.swift
//  URLSessionOperationTests
//
//  Created by Martin Lloyd on 29/10/2015.
//  Copyright © 2015 Martin Lloyd. All rights reserved.
//

import XCTest
import URLSessionOperation

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class URLSessionOperationTests: XCTestCase {
    
    var queue:   NSOperationQueue?
    var session: NSURLSession?
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override func setUp() {
        super.setUp()
        
        self.queue = NSOperationQueue()
        self.queue?.maxConcurrentOperationCount = 1;

        self.session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    override func tearDown() {
        super.tearDown()
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    func testExample() {
        
        let URL_1 = NSURL(string: "http://www.google.com")
        let URL_2 = NSURL(string: "http://www.yahoo.com")
        
        var result_1: Bool = false
        var result_2: Bool = false
        
        self.queue?.addOperation(URLSessionOperation(session: self.session!, url: URL_1!, completion:{ (data: NSData?, response: NSURLResponse?, error: NSError?) in
            result_1 = true
        }))
        
        self.queue?.addOperation(URLSessionOperation(session: self.session!, url: URL_2!, completion:{ (data: NSData?, response: NSURLResponse?, error: NSError?) in
            result_2 = true
        }))
        
        self.queue?.waitUntilAllOperationsAreFinished()
        
        XCTAssertTrue(result_1)
        XCTAssertTrue(result_2)
    }
}
