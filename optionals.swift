import UIKit
import Foundation
// optionals
// handling missing data
// nil
// when you dont have anything to speicfy or
// recall the example of the age (we cant defferentiate between unknown and new born)
// in the above case we can use nil (optional)
var age: Int? = nil
// here in the above case it age is holding nil and optional is followed by  question mark , equal to and nil

var salary:Int?=nil
print(salary)
salary=1_000_000
print(salary)

// unwrapping optionals
// this is particularly used in strings
// if we have an empty string and if use count ,it is unsafe and swift wont allow ,now comes unwrapping
var name:String?=nil
if let unwrapped=name{
    print("\(unwrapped.count) letters ")
}else {
    print("missing string not possible to count")
}

// unwrapping with guard
// alternative to if let is guard let
// it will also unwrap optionals but but if it finds nil inside, it expects you to exit the function, loop, or condition you used it in.
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
//Using guard let lets you deal with problems at the start of your functions, then exit immediately. This means the rest of your function is the happy path – the path your code takes if everything is correct.


// force unwrapping
//Optionals represent data that may or may not be there, but sometimes you know for sure that a value isn’t nil. In these cases, Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type.
let str = "5"
//let num = Int(str)
//Even though Swift isn’t sure the conversion will work, you can see the code is safe so you can force unwrap the result by writing ! after Int(str), like this:
let num=Int(str)!
//Swift will immediately unwrap the optional and make num a regular Int rather than an Int?. But if you’re wrong – if str was something that couldn’t be converted to an integer – your code will crash.
//As a result, you should force unwrap only when you’re sure it’s safe – there’s a reason it’s often called the crash operator.

// implicitly unwrappe optionals
let age1: Int! = nil
//Like regular optionals, implicitly unwrapped optionals might contain a value or they might be nil. However, unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional at all.
// Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals. However, if you try to use them and they have no value – if they are nil – your code crashes.

//Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it. Because you know they will have a value by the time you need them, it’s helpful not having to write if let all the time.

//That being said, if you’re able to use regular optionals instead it’s generally a good idea.

// NIEL coalescing
/*The nil coalescing operator unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was nil – then a default value is used instead. Either way, the result won’t be optional: it will either be the value from inside the optional or the default value used as a backup.
 
 Here’s a function that accepts an integer as its only parameter and returns an optional string:*/
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
//If we call that with ID 15 we’ll get back nil because the user isn’t recognized, but with nil coalescing we can provide a default value of “Anonymous” like this:

let user = username(for: 15) ?? "Anonymous"
//That will check the result that comes back from the username() function: if it’s a string then it will be unwrapped and placed into user, but if it has nil inside then “Anonymous” will be used instead.

//optional chaining
//Swift provides us with a shortcut when using optionals: if you want to access something like a.b.c and b is optional, you can write a question mark after it to enable optional chaining: a.b?.c.

//When that code is run, Swift will check whether b has a value, and if it’s nil the rest of the line will be ignored – Swift will return nil immediately. But if it has a value, it will be unwrapped and execution will continue.

//To try this out, here’s an array of names:

let names = ["John", "Paul", "George", "Ringo"]
//We’re going to use the first property of that array, which will return the first name if there is one or nil if the array is empty. We can then call uppercased() on the result to make it an uppercase string:

let beatle = names.first?.uppercased()
//That question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set beatle to nil immediately.

// try catch and error handling
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
/*
 That runs a throwing function, using do, try, and catch to handle errors gracefully.

 There are two alternatives to try, both of which will make more sense now that you understand optionals and force unwrapping.

 The first is try?, and changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional.

 Using try? we can run checkPassword() like this:
 */
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
/*The other alternative is try!, which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
 
 Using try! we can rewrite the code to this:*/
try! checkPassword("sekrit")
print("OK!")

/*
 When talking about force unwrapping, I used this code:

 let str = "5"
 let num = Int(str)
 That converts a string to an integer, but because you might try to pass any string there what you actually get back is an optional integer.

 This is a failable initializer: an initializer that might work or might not. You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong. The return value will then be an optional of your type, for you to unwrap however you want.

 As an example, we could code a Person struct that must be created using a nine-letter ID string. If anything other than a nine-letter string is used we’ll return nil, otherwise we’ll continue as normal.

 Here’s that in Swift:
 */
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// type casting
/*
 Swift must always know the type of each of your variables, but sometimes you know more information than Swift does. For example, here are three classes:

 class Animal { }
 class Fish: Animal { }

 class Dog: Animal {
     func makeNoise() {
         print("Woof!")
     }
 }
 We can create a couple of fish and a couple of dogs, and put them into an array, like this:

 let pets = [Fish(), Dog(), Fish(), Dog()]
 Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal.

 If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise().

 This uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise.

 Here’s how we write the loop in Swift:

 for pet in pets {
     if let dog = pet as? Dog {
         dog.makeNoise()
     }
 }

 */
