// Playground - noun: a place where people can play

import UIKit

var name = "lucas"
var age = 20
var grades = [95,85,60,50]
grades[0] = 80
grades

grades.append(79)
let val = grades.removeLast()
grades
var nameAndAges = ["Lucas": 20, "bob": 24, "Yoda": 900]

if let age = nameAndAges["Yoda"] {
    age
}
else{
    println("Doesn't exist")
}

let possnum = "123"
let num = possnum.toInt()

num!+5

let (Alex, number) = ("Alex", "607-793")
Alex
number

let entry = (name2:"Bob", number2: "5343")
entry.name2

func sayHi(){
    println("Welcom \(name)")
}

func sayHelloUser (name: String){
    println( "Weocome \(name)")
}

func addTen(num:Int) -> Int {
    return num + 10
}

addTen(9)

func sum(arrayOfNums: [Int]) -> Int {
    var sum = 0
    for num in arrayOfNums {
        sum += num
    }
    return sum
}

sum([6,2,2,1,5,3,2])

func join(string:String, toString string2:String, withJoiner joiner:String) -> String{
    return string + joiner + string2
}

join("CUAppDev", toString: "is awesome!", withJoiner: "...")


class Person: NSObject {
    var name = ""
    var age = 0
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    init(name:String) {
        self.name = name
    }
    
    override var description: String {
        return "\(name) is \(age) years old"
    }
}

let p = Person(name:"Lucas", age:20)
let p2 = Person(name:"Yoda")
p.name
p.age
println(p)




