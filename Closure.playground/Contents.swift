import UIKit

// closures in swift are similar to blocks in objective-C and to lamdas in other programming languages.
// closure can capture and store references to any constants and variables from the context in which they are defined. This is know as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

// Read Documentation

//---------------------------------------------------------------------------------//

// The sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Deniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    print("--")
    print(s1, s2)
    print(s1 > s2)
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
var sortedArray = names.sorted()

// write this in closure form

// closure Expression

/*
 {(parameters) -> return type in
    statement
 }
 */

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    print("--closure--")
    print(s1, s2)
    print(s1 > s2)
    return s1 > s2
})

//---------------------------------------------------------------------------------//

// inferring type from context

reversedNames = names.sorted(by: { (s1, s2) in
    return s1 > s2
})

//---------------------------------------------------------------------------------//

// Impicit Returns from Single-Expression Closures

reversedNames = names.sorted(by: { (s1, s2) in s1 > s2 })

//---------------------------------------------------------------------------------//

// Shorthand argument Names

// swift automatically provides shorthand names to inline closures, which can be used to refer to the values of the closure's arguments by the names $0, $1, $2 and so on.
reversedNames = names.sorted(by: { $0 > $1 })

//---------------------------------------------------------------------------------//

// Operator Methods

reversedNames = names.sorted(by: >)

//---------------------------------------------------------------------------------//

// Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // Function body goes here
}

// Here's how you can call this function without using a trailing closure :

someFunctionThatTakesAClosure(closure: {
    // closure body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}


//

reversedNames = names.sorted() { $0 > $1 }

//

reversedNames = names.sorted { $0 > $1 }

//

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


//

//func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
//    if let picture = download("photot.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
//
//func loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("couldn't download the next picture.")
//}

//

//---------------------------------------------------------------------------------//

// Capturing Values

func  makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrement(forIncrement: 10)
let incrementBySeven = makeIncrement(forIncrement: 7)

incrementByTen()
incrementByTen()
incrementBySeven()
incrementBySeven()

//---------------------------------------------------------------------------------//

// Closure are reference Types

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

incrementByTen()

//---------------------------------------------------------------------------------//
