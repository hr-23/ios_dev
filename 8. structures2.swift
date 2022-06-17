import UIKit
import Foundation

// structures part 2
// initializers

//We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this:
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "twostraws"

// referece to the current instance (self)
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// lazy operations
// once refer

// static properties and methos ( like wihch is property of the struct itself and not of instances
struct Student{
   static var classsize=0
    var name:String
    init(name:String){
        self.name=name
        Student.classsize+=1
    }
}
var p1=Student(name:"harshaa reddy")
var p2=Student(name:"jasmin ")
var p3=Student(name:"raunak ")
print(Student.classsize)

// access controls
// private
struct Name{
    var name:String
    private  var id:Int
    init(name:String,id:Int)
    {
        self.name=name
        self.id=id
    }
    func details()->String{
        return "The details of the preson are \(name) and id \(id)"
    }
}
var ps1=Name(name:"harshaa reddy", id:123)
print(ps1.details())

