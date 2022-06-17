import UIKit
import Foundation
// arrays ,sets ,tuples and dictionaries (just like map in c++) and ennumerations
// creating arrays
let p1="harsha"
let p2="nagi reddy"
let p3="parvathi"
let p4="chetana"
var family=[p1,p2,p3,p4]
family.insert("om", at:0) // insertion in array at a particular postion
print(family)
print(family[1])
// arrays uing type annotations
let arr:[Int]=[1,2,3,4]
print(arr)
// creating sets
Set(arr) // in sets items are stored in random ordre and no duplicates are allowed
print(arr)
let set=Set([10,20,30,40])
print(set) //notice that they are being printed in a random order
// tuples
// we can store multiple values together in the tuples and its size is fixed and we cannot change the size of the tuples and we can access the elements using indexing
let name=(first:"harsha", last:"reddy")
print(name.last)
print(name.0)
// more examples to differentiate between tuples and arrays and sets
let address=(house_no:233, name:"harshaa reddy",location:"india")
// the above is a tuple which differentiates between all the three
// if you dont want to store the duplicats of the same type then use set and if you want to store duplicates too then use array
let heights:[String:Double]=[
    "harsha reddy":5.6,
    "chetana":5
]
print(heights["harsha reddy"])
print(heights["avg"])
// we can create default values using default keyword

// creating empty collections
var arr1=[Int]()
var dict=[String:Int]()
var st=Set<Int>()
var st1=Set<String>()
var array=Array<Int>()
var scores=Dictionary<String,Int>()
// tha above all will crate an empty literal and we can add data into them

// ennumerations are that which we wanted to use them multiple times so we can create a standard form and reuse again
enum Result
{
    case success
    case failure
}
// and when we want to create another result variable then we can choose form the tow cases here only like show in the example below l
let res=Result.success
// this stops us from accidentally using another forms of representation
// for enums we can also add more data so that it will be unambiguious
enum Activity{
    case bored
    case running(destination: String)
    case talking(topic :String)
    case walking(distance: Int)
}
let talking=Activity.talking(topic:"career")

// raw values for
enum Planet: Int {
    case mercury=1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 2)
// now earth will be the third one
// if we want we can assign as shown above also
// recall all what you have studied
// summary
/*
 Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 Arrays store items in the order you add them, and you access them using numerical positions.
 Sets store items without any order, so you can’t access them using numerical positions.
 Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 Dictionaries store items according to a key, and you can read items using those keys.
 Enums are a way of grouping related values so you can use them without spelling mistakes.
 You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */






