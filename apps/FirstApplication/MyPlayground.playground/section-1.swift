// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let testFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
let appleSummary = "I have \(width) apples"
let stringSum = "hello" + " world!"
var list = [1,3,4]
println(list[1])
list[1]
var dict = [1:"zero"]
dict[1]
println(dict[1])
let visavis = "\(dict[1]) is the loneliest number"
println(visavis)
let emptyArray = [String]()
let emptyDictionary = [:]
let scores = [72,123,15,234,2]
var teamScore = 0

for score in scores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
teamScore

var optional: String? = "hi"
optional == nil
if let name = optional {
    println("\(name) world!")
}
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var Best = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            Best = kind
        }
    }
}
largest
Best

for i in 0..<4 {
    println(i)
}

func kill(name:String)->String{
    return "kill \(name)"
}

kill("bob")

func average(numbers:Int...)->(Int){
    var sum = 0
    var num = 0
    for i in numbers{
        sum += i
        num += 1
    }
    return sum/num
}

average(2,4,6)

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

increment(increment(8))

