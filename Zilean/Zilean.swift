//
//  Created by Joan Molinas Ramon on 9/12/15.
//  Copyright © 2015 Joan Molinas. All rights reserved.
//

import Foundation

class Zilean {
    
    //MARK: Main functions
    class func time <T> (
        @autoclosure f f: () -> T,
        times : Int) -> Double {
            /*
            * Return :
            * Seconds to execute the function n times.
            */
            let start = NSDate()
            
            for _ in 0..<times {
                f()
            }
            
            let end = NSDate()
            
            return end.timeIntervalSinceDate(start)
    }
    
    class func time <T> (
        @autoclosure f f:() -> T,
        @autoclosure f2:() -> T,
        times : Int) -> Double {
            /*
            * Return :
            * 0 if function1 time was equal function2 time
            * 1 if function2 time was faster than function1 time
            * -1 if function1 time was faster than function2 time
            */
            
            let fTime = time(f: f, times: times)
            let f2Time = time(f: f2, times : times)
            
            if fTime == f2Time { return 0 }
            else if fTime < f2Time { return -1 }
            else { return 1 }
    }
}

extension Zilean {
    
    //MARK: Most simple functions
    class func time <T> (
        @autoclosure f:() -> T) -> Double {
            
            return time(f: f, times: 1)
    }
    
    class func time <T> (
        @autoclosure f f:() -> T,
        @autoclosure f2:() -> T) -> Double {
            return time(f: f, f2: f2, times: 1)
    }
    
}

extension Zilean {
    
    //MARK: Functions with Log
    class func timeLog <T> (
        @autoclosure f f:() -> T) {
            print("Seconds: \(time(f: f, times: 1))")
    }
    
    class func timeLog <T> (
        @autoclosure f f:() -> T,
        times : Int) {
            print("Seconds: \(time(f: f, times: times))")
    }
    
    class func timeLog <T> (
        @autoclosure f f:() -> T,
        @autoclosure f2:() -> T)  {
            print(time(f: f, f2: f2, times: 1))
    }
    
    class func timeLog <T> (
        @autoclosure f f:() -> T,
        @autoclosure f2:() -> T,
        times : Int)  {
            print(time(f: f, f2: f2, times: times))
    }
}

extension Zilean {
    
    //MARK: Functions return 2 value times
    class func times <T> (
        @autoclosure f f: () -> T,
        @autoclosure f2 : () -> T,
        times : Int) -> (Double, Double) {
            let fTime = time(f: f, times: times)
            let f2Time = time(f: f2, times : times)
            
            return (fTime, f2Time)
            
    }
    
    class func times <T> (
        @autoclosure f f: () -> T,
        @autoclosure f2 : () -> T) -> (Double, Double) {
            let fTime = time(f: f, times: 1)
            let f2Time = time(f: f2, times : 1)
            
            return (fTime, f2Time)
            
    }
}

/* EXPERIMENTALLY */

extension Zilean {
    
    class func randomInt(range : ClosedInterval<Int>) -> Int {
        return range.start + Int(arc4random_uniform(UInt32(range.end - range.start + 1)))
    }
    class func randomFloat(range: ClosedInterval<Float>) -> Float {
        return range.start + (range.end - range.start) * Float(Float(arc4random()) / Float(UInt32.max))
    }
    
    class func randomDouble(range: ClosedInterval<Double>) -> Double {
        return range.start + (range.end - range.start) * Double(Double(arc4random()) / Double(UInt32.max))
    }
    
    class func randomString(length : Int) -> String {
        let characters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let mutableString = NSMutableString(capacity: length)
        for var i = 0; i < length; i++ {
            mutableString.appendFormat("%C", characters.characterAtIndex(Int(arc4random_uniform(UInt32(characters.length)))))
        }
        return mutableString as String
    }
}

extension Zilean {
    func timesWithRandomValues <T> (f : () -> T) {
        
    }
}

