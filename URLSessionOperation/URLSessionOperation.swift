//
//  URLSessionOperation.swift
//  URLSessionOperation
//
//  Created by Martin Lloyd on 29/10/2015.
//  Copyright © 2015 Martin Lloyd. All rights reserved.
//

import UIKit

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
public typealias URLSessionOperationCompletion = (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
public class URLSessionOperation: NSOperation {

    var task: NSURLSessionDataTask!
    
    private var _executing: Bool = false
    public override var executing: Bool {
        get {
            return self._executing
        }
        set { if self._executing != newValue {
                willChangeValueForKey("isExecuting")
                self._executing = newValue
                didChangeValueForKey("isExecuting")
            }}
    }
    
    private var _finished: Bool = false;
    public override var finished: Bool {
        get { return self._finished }
        set { if self._finished != newValue {
                willChangeValueForKey("isFinished")
                self._finished = newValue
                didChangeValueForKey("isFinished")
            }
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    public init(session: NSURLSession, url: NSURL, completion: URLSessionOperationCompletion) {
        super.init()
        
        self.task = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
                self.completeOperationWithBlock(completion, data: data, response: response, error: error)
            }
        )
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    public override func cancel() {
        super.cancel()
        self.task.cancel()
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    public override func start() {
        if (self.cancelled) {
            self._finished = true
        }
        else {
            self._executing = true
            self.task.resume()
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    public func asynchronous() -> Bool {
        return self.asynchronous
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func completeOperationWithBlock(completion: URLSessionOperationCompletion,  data: NSData?, response: NSURLResponse?, error: NSError?) {
        if self.cancelled == false {
            completion(data: data, response: response, error: error)
        }
        
        self.completeOperation()
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    private func completeOperation() {
        self.willChangeValueForKey("isFinished")
        self.willChangeValueForKey("isExecuting")
    
        self._executing = false
        self._finished = true
    
        self.didChangeValueForKey("isExecuting")
        self.didChangeValueForKey("isFinished")
    }
}

