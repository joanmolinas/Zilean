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
        
        Zilean.timeLog(f: functionWithReturn(), times : 1000)
        Zilean.timeLog(f :linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99), times: 50)
        
    }
    
    //MARK: Zilean samples
    //Linear Search
    func linearSearch(key key : Int) {
        var loops = 0
        for number in list {
            if number == key {
                break
            }
            
            loops++;
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

