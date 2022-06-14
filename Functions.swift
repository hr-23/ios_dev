import UIKit
import Foundation
// functions in swift
// standard message with no other parameters
func printmes()
{
    let mess="""
    this is a multi line
    message
    is an example for standard funciton with no parameter
    """
    print(mess)
}
printmes()

// fucntions with parameters
func square(num:Int)
{
    print(num*num)
}
square(num:4)
// fucntion with returning something
// here observe carefully that here we are internally using n to refer to the num so we have denoted it like that
// recall that in general functions we may pass different from the another which we pass
func ret_mul5(num n:Int)->Int{
    return 5*n
}
print(ret_mul5(num:5))

func ret_mul6(num :Int)->Int{
    return 6*num
}
print(ret_mul5(num:5))

// omitting the label parameters
// if we dont want to pass any parameter( like in this case when we have to print only one string then we use the following symbol (_) so that there is no need of any parameter
func greet11(_ mess:String)
{
    print(mess)
}

greet11("hi harsha")

// look at the below two ways
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor")
greet("Taylor", nicely: false)

// variadic functions
// we can make any parameter variadic by writing ...
// look at the below example to know how to do so
func square(num:Int ...)
{
    for n in num
    {
        print(n*n)
    }
}
square(num: 1,2,3)
// above the function treats the multiple passed values as an array and passes them over
// swift converts them into arrays

// throwing functions
// like throwing errors
// sometimes the functions fail because they may have bad input or something might have gone wring internally
// so swift lets us to throw some errors

// first we need to write a enum which throws error
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
// in inputs if we want to send the reference to the paremeter then we can modify the function like this
func double_the_num(num: inout Int)
{
    num*=2;
}
var num=4;
double_the_num(num:&num)
print(num)
