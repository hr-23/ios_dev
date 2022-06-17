import UIKit
import Foundation

// classes
// classes seem to be same as structs as they too are used to create new data types with properties and methods but these classes exhibit an important feature called inheritance
// inheritance is the ability to build a class on the foundations of another one
// classes are very important when building real  ios apps

// creating your own classes

// the most important difference is that structs come with memberwise initializers but classes will not have ,we need to initialize , notice that it showed error when you didnt write init
class Dog{
    var name:String
    var breed:String
    init(name:String,breed:String)
    {
        self.name=name
        self.breed=breed
    }
    
}
let dog1=Dog(name:"jonny",breed:"german shephard")

// class inheritance
// the new class we are creating can inherit the other class which we want , the new class which we create will inherit all the properties of the parent class and also will have properties specific to the particular class (child class )
// example
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// note that the chid class must also have own initializer
// another example would be human class and sub class would be men and women

// overriding methods
class Man{
    var name:String
    var gender:String
    init(name:String,gender:String)
    {
        self.name=name
        self.gender=gender
    }
     func tellgender()
    {
        print("gender is \(gender)")
    }
}
var p1=Man(name:"Harshaa reddy",gender:"M")
p1.tellgender()
class P:Man{
    override func tellgender()
    {
        print("have a nice day and your gender is \(gender)")
    }
}
var p2=P(name:"chatana",gender:"F")
p2.tellgender()
// this is the method overriding


// final classes
// whenever you want your class to restrict it form further expand it then you can use the final keyword to restrict other developers to stop using it
final class Dog5 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// copying objects
// when you copy structs both are the different things (original and copy) changing one wont change the other ,when you copy a class both the original and the copy point to the same thing , so changing one does change the other
class singer {
    var name="tylor swift"
}
var s1=singer()
print(s1.name)

var s2=s1
s2.name="harshaa reddy"

print(s1.name)
// this is different in the case of struct

// deinitializers
// this is also one of the difference between classes and structs
// it is nothing but the ecode which runs when the instance is destroyed
// for exampel look into the following code
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }

}
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// mutability
// this is the final difference between classes and structs
// it is the way in which classes deals with constants
// it can change if not decalred constant
class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
