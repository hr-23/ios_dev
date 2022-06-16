import UIKit
import Foundation
// protocols and extension
// protocol oriented programming (POP)
//POP does away with large, complex inheritance hierarchies, and replaces them with much smaller, simpler protocols that can be combined together.

// protocols are the way of describing what properties and methods something must have
protocol Identifiable{
    var id:String{get set}
}
// we cannot create an instance of the protocol but we can create a struct which conforms to it
struct User:Identifiable{
    var id:String
}
func display(thing: Identifiable)
{
    print("My id is \(thing.id)")
}

// protocol inheritance
// one protocol can inherit from other protocol is called protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
// We can now create a single Employee protocol that brings them together in one protocol. We don’t need to add anything on top, so we’ll just write open and close braces:
protocol Employee: Payable, NeedsTraining, HasVacation { }

// extensions
// extensions allow you ot add methods to existing types , to make them do things which they werent originally designed for
extension Int {
    func squared() -> Int {
        return self * self
    }
}
var n=8
print(n.squared())
n=10
print(n.squared())

// swift will not let you add stored properties in extensions
// it only allows computed  properties

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
print(n.isEven)

// protocol extensions
// protocol lets you describe what methods something should have ,but doesnt provide the code inside and extensions will let you describe the code inside , but we cant add methods of large types at the same time
// Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes.
let pythons = ["Eric", "Graham", "John", "Michael"]
let beatles = Set(["John", "Paul", "George", "George"])
// here as in swift both the arrays and sets confine conform to a protocol called collection
// we can write the extension as follows
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

// protocol oriented programming
// prptocol extensions can provide default implementation for our own protocol methods
protocol Identifiable1 {
    var id: String { get set }
    func identify()
}
extension Identifiable1 {
    func identify() {
        print("My ID is \(id).")
    }
}
struct User1: Identifiable1 {
    var id: String
}

let twostraws = User1(id: "twostraws")
twostraws.identify()
