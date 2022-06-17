import UIKit
import Foundation

// creating closures
// closures arenothing but like functions which we can create as variables and we can use it
//This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.
let driving={
    print("i am driving")
}
driving()
// accepting parameters in a closure
// here parameters are written in a diferent way as shown like this
let driving1={ (place:String) in
    print("i am driving to \(place)")
}
driving1("London")

// here apart from the traditional functions which we create using func ,here while calling for function there is no need to specify for which parameter you are calling

//returning values from closure
let driving2={(place:String)->String in
    return ("I am going to \(place) and will be back")
}

print(driving2("New York"))

// closures as parameters

func travel(action:()->Void){
    print(" i am ready to go")
    action()
    print("end of action")
}
travel(action:driving)

// trailing closure syntax
// if the last parameter to a fucntion is a closure swift lets you use a special syntax called trailing closure syntax
// now run this and you will understand how this is happening

travel {
    print("Im printing the trailing closure syntax")
}

// using closures as parameters when they accept parameters

func travel1(action:(String)->Void )
{
    print("im going out")
    action("London")
    print("ok come back fast")
}
travel1{ (place:String) in
       print("going to \(place) ")
}

// using closures when they return parameters

func travel2(action :(String)-> String)
{
    print(" this is a demo of closures as parameters when they are returning ")
    print(action("London"))
    print(" this is the end ")
}
travel2{(place:String)->String in
    return "I am going to dream place \(place) "
}

// short hand parameter names

// here take a look at the above function we can now say that travel2 can be rewritten like this as swift knows what we are returning
travel2{
    "I am going to \($0) in my car ,"
}

// closures with multiple parameters

func travel3(action:(String,Int)->String)
{
    print("demo of closure with multiple parameters ")
    print(action("London",50))
}
travel3{
    return "I am going to \($0) with a speed of \($1)"
}

//returning closures from functions
// like we pass closure to a function we can get a closure from function too
// here the funcion is returning a closure
// now the syntax will have two arrows one for return value of the function and the other one the return value of the closure
func travel4()->(String)->Void{
    return{
        print(" this is a closure returnging \($0)")
    }
}
let result=travel4()
result("good demo")

// capturing values
// extrenal values are captured by the closures which are written inside the function

func travel5() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result1 = travel5()
result1("London")
result1("London")
result1("London")
