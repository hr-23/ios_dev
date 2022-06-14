import UIKit
import Foundation
// loops in swift
// for declaring the range of the numbers
let count=1..<5 // for including numbers form 1 to less than 5
let count1=1...3 // numbers areincluded tll 5 (including)
// for printing the numbers in the range from 1 to 10
for num in count
{
    print(num)
}
let albums=["harsha", "reddy","godlaveeti"]
for i in albums {
    print(i)
}
// if we want to print a statement for as many times as we want we can just use an underscore
for _ in count1
{
    print("om namo venkateshaya")
}
// while loops
var num=1;
while(num<=3)
{
    print("om namah shivaya")
    num+=1
}
// repeat loops same as do while loop
// the statement inside repeat will be executed atleast once  even if the condition fails
var num1=0
repeat{
    print("Om shri matrae namaha")
    num1+=1
}while(num1<3)

// exiting loops
// we can exit loops using break statement
// the regular/ standard break statement functiosn as same but
// there is a special statement that is exiting loops
outerLoop: for i in 1...3 {
    for j in 1...3 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 6 {
            print("It's a 6!")
            break outerLoop
        }
    }
}
// as we can see above we have braken from the outer loop (we named that as outer loop )
// outerLoop
ol: for i in 1..<5
{
    print("om shri lakshmi ye namaha")
    if(i==3) {break ol}
}
// continue statement will be executed as it as same in c++ when we want to skip mutiple statements but not completely exit/ break from the loop

