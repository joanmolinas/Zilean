//
//  Created by Joan Molinas Ramon on 9/12/15.
//  Copyright © 2015 Joan Molinas. All rights reserved.
//

import Foundation

class Zilean {
    
    //MARK: Functions with Return
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
    
    class func time <T> (
        @autoclosure f:() -> T) -> Double {
        
            return time(f: f, times: 1)
    }
    
    class func time <T> (
        @autoclosure f f:() -> T,
        @autoclosure f2:() -> T) -> Double {
            return time(f: f, f2: f2, times: 1)
    }
    
    
    //MARK: Functions with 2 return values
    
    
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
