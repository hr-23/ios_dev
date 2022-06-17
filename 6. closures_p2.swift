import UIKit
import Foundation

// using closures as parameters when they accept parameters
func travel(action:(String)->Void)
{
    print(" this is a func accepting closure")
    action("google london")
    print("chase your dreams")
}
travel{
     print("this is your destinration \($0)")
}

// using closurs as parameters when they return values
func travel1(action:(String)->String)
{
    print(" this function is accepting the closures with return values ")
    let res=action("London")
    print(res)
}
travel1{
    return " this is your destination \($0) and you have to make it true"
}

// shiort hand parameter naems
// you already know you are using the dollar symbols but still revise again

// closures with multiple parameters
func travel2(action :(String,Int)->String)
{
    print(action("Google London",50))
}
travel2{
    return "You are going to your destination \($0) with a speed of \($1) kmph"
}

// returning closures from functions
func travel3()->(String)->Void{
    return {
        print(" this is a closure being returned form the function \($0)")
    }
}
let res=travel3()
res("GL")
