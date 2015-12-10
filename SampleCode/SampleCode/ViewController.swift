//
//  ViewController.swift
//  SampleCode
//
//  Created by Joan Molinas Ramon on 9/12/15.
//  Copyright © 2015 Joan Molinas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var list : Array<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<100 {
            list.append(i)
        }
        
        //Time for one function, the time is in seconds.
        print(Zilean.time(f: linearSearch(key: 50)))
        print(Zilean.time(f: linearSearch(key: 50), times: 1000))
        
        //Compare 2 functions
        print(Zilean.time(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99)))
        print(Zilean.time(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99), times: 100))
        
        //Get both times
        print(Zilean.times(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99)))
        print(Zilean.times(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99), times : 100))
        
        //Print a log
        Zilean.timesLog(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99), times : 100)
        
        
        
    }
    
    //MARK: Zilean samples
    //Linear Search
    func linearSearch(key key : Int) {
        for number in list {
            if number == key {
                break
            }
        }
    }
    
    //Binary Search
    func binarySearch(
        key key : Int,
        imin: Int,
        imax: Int) {
        
            guard key <= imax+1 else {
                return
            }
            
            let midIndex : Double = round(Double((imin+imax)/2))
            let midNumber = list[Int(midIndex)]
            
            if midNumber > key {
                binarySearch(key: key, imin: imin, imax: Int(midIndex)-1)
            } else if midNumber < key  {
                binarySearch(key: key, imin: Int(midIndex)+1, imax: imax)
            } else {
                
            }
    }
    
    func functionWithReturn() -> Int {
        return 2+2
    }



}

