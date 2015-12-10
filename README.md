
# Zilean⌛️

Zilean is a simple class to calculate the time to execute one function.
It's easy, you pass your function to Zilean and he will calculate the time to execute 1 or n times. 
Also, you can compare 2 functions... Zilean provides several functions for compare or get this times. 
 

## Installation

### Manual
Drag and copy Zilean Folder into your project.

###Carthage
`Not available yet`

###Cocoapods
`Not available yet`

## More easy, impossible
Imagine you have 2 functions for do the same task...

```swift
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
```

And you want know... What functions is most **efficient**? What function is better when is executed n times?? 
It's easy to know, only you need use the follow methods:

```swift
//Time for one function, the time is in seconds.
Zilean.time(f : linearSearch(key : 50)) //Time: 5.80549240112305e-05 seconds
Zilean.time(f : linearSearch(key : 50), times: 1000) //Time: 0.0134759545326233 seconds
```

```swift
//Compare 2 functions
// Return :
// 0 if function1 time was equal function2 time
// 1 if function2 time was faster than function1 time
// -1 if function1 time was faster than function2 time
Zilean.time(f : linearSearch(key : 50), f2: binarySearch(key : 50, imin : 0, imax : 99)) //OUTPUT: -1
Zilean.time(f: linearSearch(key : 50), f2: binarySearch(key : 50, imin : 0, imax : 99), times : 100) //OUTPUT: 1
```

```swift
//Get both times
Zilean.times(f : linearSearch(key : 50), f2: binarySearch(key : 50, imin : 0, imax : 99)) //Times: (1.19805335998535e-05, 1.01327896118164e-06)
Zilean.times(f : linearSearch(key: 50), f2 : binarySearch(key : 50, imin : 0, imax : 99), times : 100) //Times: (0.00122100114822388, 3.09944152832031e-05)
```

```swift
//Get both times
Zilean.times(f : linearSearch(key : 50), f2: binarySearch(key : 50, imin : 0, imax : 99)) //Times: (1.19805335998535e-05, 1.01327896118164e-06)
Zilean.times(f : linearSearch(key: 50), f2 : binarySearch(key : 50, imin : 0, imax : 99), times : 100) //Times: (0.00122100114822388, 3.09944152832031e-05)
```
```swift
//Print a log
Zilean.timesLog(f: linearSearch(key: 50), f2: binarySearch(key: 50, imin: 0, imax: 99), times : 100) //Console: "Seconds: f1 = 0.00120401382446289, f2 = 3.39746475219727e-05"
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b Zilean-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request 👌

## Credits

 - Joan Molinas ([website](www.joanmolinas.com))

## License

Zilean is available under the MIT license.
