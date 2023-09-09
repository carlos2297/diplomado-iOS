//: [Previous](@previous)

import Foundation

// clousure

//let volunteerCounts = [1,3,40,32,2,53,77,13]
//
//func isAscending(_ i: Int, _ j: Int) -> Bool{
//    return i<j
//}
//
//let volunteerSorted = volunteerCounts.sorted(by: isAscending)
//
//print(volunteerSorted)
//
//let volunteerSorted1 = volunteerCounts.sorted(by: {i, j in i < j})
//
//print(volunteerSorted1)
//
//let volunteerSorted2 = volunteerCounts.sorted(by: {$0 < $1})
//
//print(volunteerSorted2)
//
//let volunteerSorted3 = volunteerCounts.sorted {$0 < $1}
//
//print(volunteerSorted3)

func doAwesomeWork(on input: String, using transformer:()-> Void, then completion:() -> Void){
    //Here would go the logic to do the awesome work
}

doAwesomeWork(on: "Diplomado"){
    
}then:{
    
}

doAwesomeWork(on: "Diplomado", using: {}, then: {})

let volunteerCounts:[Double] = [1,3,40,32,2,53,77,13]
let volunteerAverage:[Double] = [10.75,4.2,1.5,12.12,16.815]

func format(numbers: [Double],using formatter:(Double) -> String) -> [String]{
    
    var result = [String]()
    for number in numbers{
        let transformedNumber = formatter(number)
        result.append(transformedNumber)
    }
    return result
}

func rounder(_ number: Double) -> String {
    let roundedNumber: Int = Int(number)
    return "\(roundedNumber)"
}

func addDescription(_ number: Double)-> String{
    return "volunteer average: \(number)"
}

let formatterAverageVolunteer = format(numbers: volunteerAverage, using: rounder)
let averageVolunteersDescription = format(numbers:volunteerAverage, using:addDescription)


print(volunteerAverage)
print(formatterAverageVolunteer)
print(averageVolunteersDescription)

//let roundedVolunteers = volunteerAverage.map{ number in
//    let roundedNumber = Int(number)
//    return "\(roundedNumber)"
//}

let roundedVolunteers = volunteerAverage.map{ number in
    return Int(number)
}

print(roundedVolunteers)

let passingVolunteers = roundedVolunteers.filter { number in
    return number >= 10
}

print(passingVolunteers)

let totalVolunteers = passingVolunteers.reduce(0) {
    partialResult, number in
    return partialResult + number
}

print(totalVolunteers)
