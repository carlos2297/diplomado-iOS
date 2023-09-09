//: [Previous](@previous)

import Foundation

var cellphone: String = "5564758456"

//puede tener o no un valor
var landline: String? = "000"


print(cellphone)
print(landline ?? "no tengo telefono")


if let landline2 = landline{
    print(landline2)
}

guard let landline2 = landline else{
    fatalError("oops")
}
//: [Next](@next)
