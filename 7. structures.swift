import UIKit
import Foundation

// creating structures
struct sport{
    var name:String
}
// now we have ceated a struct and now we are creating an istance of it and using it

var sp1=sport(name:"Tennis")
print(sp1.name)
sp1.name="kabaddi"
//we can change the sport name as we have made name and sp1 as var
print(sp1.name)

// computed properties
struct Sport{
    var name:String
    var isOlympic:Bool
    var olympicstatus:String{
        if isOlympic{
            return "\(name) is an olympic sport"
        }
        return "\(name) is not an olympic sport"
    }
}
let sp2 = Sport(name: "Chessboxing", isOlympic: false)
print(sp2.olympicstatus)

//property observers
//these are like observing properties like if we want to know the changes made then we can use didSet and willSet (where willSet si rarely used)
struct Progress{
    var task:String
    var amount:Int{ // here observe properly
    didSet {
        print("\(task) is now \(amount)% complete ")
    }
}
}
var p1=Progress(task:"studying",amount:10)
p1.amount=20
p1.amount=50
p1.amount=75
p1.amount=100

// methods
// functions inside the structs are called methods
// these mothods still use the func keyword

struct City{
var name:String
    var population:Int
    func collect()->Int{
        return population*200
    }
}
var city1=City(name:"New York",population:1_000_000)
print(city1.collect())
var city2=City(name:"London",population:2_000_000)
print(city2.collect())

// mutating methods
struct Person{
    var name:String
    mutating func makeanony(){
        name="Anonymous"
    }
}
var per1=Person(name:"harshaa reddy")
print(per1.name)
per1.makeanony()
print(per1.name)

//properties and methods of string
// all the strings are structs and they have many methods
let s="Harshaa Reddy Godlaveeti"
print(s.count) // counts the number of characters
print(s.hasPrefix("Ha")) //returns if the string has given prefix or not
print(s.uppercased()) // we can just modify at that moment it does not completely becomes upper
print(s)
print(s.sorted())
// this sorted function sorts all the charactes in the form of the array

//properties and methods of the araays
var toys=["Moody"]
print(toys.count)
toys.append("Buzz")
toys.append("Buzz")
toys.firstIndex(of: "Buzz") //basically prints the index no need of any print st.
print(toys.sorted())
toys.remove(at: 0)
print(toys)

// initializers

// when we want to initialize with default values
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var u1=User()
u1.username="Harshaa Reddy"

// referring to the current instance
// self keyword
struct Person1 {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// lazy properties
//As a performance optimization, Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time:

// static properties and methods
// all the poprerties and methods you have created so far have belomged to the individual instance of the structs which means that if we had a Student struct we could create several student instances each with their own properties and methods:

// now suppose you want to know the size of the class or you want the person to know his number while registering ,like he is the first or second or third person we can have a static variable which will be in all the instances you will get to know by seeing this example

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ps1=Student(name:"Harshaa Reddy")
let ps2=Student(name:"Aditya")
print(Student.classSize)
// note that here the class size is static in all the instances
// also note that here the classSize is not a method but its a property that belongs to the instance itself
// if we try to print ps1.calssSize then it shows error as it is static

// access controls
// public , private and protected recall in c++

// private data
// storing social security number
struct PersonUSA {
   private var id: String

    init(id: String) {
        self.id = id
    }
    func identity()->String{
        return "My identity number is \(id) ."
    }
}

let ed = PersonUSA(id: "12345")
// here we have made the id private now we cant read it form outside
// ed.id will not work
// only methods inside the struct will work
// this will keep the data protected or restricting the unwanted access
// another access control mwthod is the public where others can use the data


