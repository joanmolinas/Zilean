//
//  Created by Joan Molinas Ramon on 9/12/15.
//  Copyright © 2015 Joan Molinas. All rights reserved.
//

import Foundation

class Zilean {
    
    //MARK: Functions with Return
    class func time <A> (
        @autoclosure f: () -> A,
        times : Int) -> Double {
            /*
            * Return :
            * Seconds to execute the function n times.
            */
            print("/=====================================/")
            print("Started")
            let start = NSDate()
           
            print("Executing function \(times) times")
            for _ in 0..<times {
                f()
            }
            
            let end = NSDate()
            print("Finished")
            
            return end.timeIntervalSinceDate(start)
    }
    
    class func time <A> (
        @autoclosure f:() -> A,
        @autoclosure f2:() -> A,
        times : Int) -> Double {
            /*
            * Return :
            * 0 if function1 time was equal function2 time
            * 1 if function2 time was faster than function1 time
            * -1 if function1 time was faster than function2 time
            */
            
            let fTime = time(f, times : times)
            let f2Time = time(f2, times : times)
            
            if fTime == f2Time { return 0 }
            else if fTime < f2Time { return -1 }
            else { return 1 }
    }
    
    class func time <A> (
        @autoclosure f:() -> A) -> Double {
        
            return time(f, times: 1)
    }
    
    class func time <A> (
        @autoclosure f:() -> A,
        @autoclosure f2:() -> A) -> Double {
            return time(f, f2: f2, times: 1)
    }
    
    //MARK: Functions with Log
    class func timeLog <A> (
        @autoclosure f:() -> A) {
            print("Seconds: \(time(f, times: 1))")
    }
    
    class func timeLog <A> (
        @autoclosure f:() -> A,
        times : Int) {
            print("Seconds: \(time(f, times: times))")
    }
    
    class func timeLog <A> (
        @autoclosure f:() -> A,
        @autoclosure f2:() -> A)  {
           print("Seconds: \(time(f, f2: f2, times: 1))")
    }
    
    class func timeLog <A> (
        @autoclosure f:() -> A,
        @autoclosure f2:() -> A,
        times : Int)  {
            print("Seconds: \(time(f, f2: f2, times: times))")
    }
    
    
}