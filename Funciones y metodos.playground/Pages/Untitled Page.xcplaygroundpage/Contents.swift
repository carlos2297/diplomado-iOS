import Foundation

//1
//func myAwesomePrintingFunction(){
//    print("Hello world")
//}
//
//myAwesomePrintingFunction()


//2
//func myAwesomePrintingFunction(name: String){
//    print("Hello \(name)! Welcome to the class")
//}
//
//myAwesomePrintingFunction(name: "Carlos")

//3
//func add(lhs: Int,rhs: Int){
//
//    print("\(lhs) + \(rhs) = \(rhs + lhs)")
//}
//
//add(lhs: 2, rhs:2)



//4 usar un nombre interno y uno para la funcion (nombre externo(to) nombre interno(name)
//
//func printWelcomeMenssage(to name: String, course: String){
//    print("Hello \(name), welcome to \(course)")
//}
//
//printWelcomeMenssage(to: "Carlos", course: "Diplomado Android")



//5 valores pode defecto
//func printWelcomeMenssage(to name: String, course: String = "Diplomado iOS"){
//    print("Hello \(name), welcome to \(course)")
//}
//
//printWelcomeMenssage(to: "Carlos")
//printWelcomeMenssage(to: "Carlos", course: "Diplomado Android")

//6 valores inout

//var error = "Thre process failed: "
//
//func appendErrorCode(code: Int, toErrorString errorString: inout String){
//    if code == 400{
//        errorString += "bad request."
//    }
//}
//print(error)
//appendErrorCode(code: 400, toErrorString: &error)
//print(error)

//7 sin nombre externo

//var error = "Thre process failed: "
//
//func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
//    if code == 400{
//        errorString += "bad request."
//    }
//}
//print(error)
//appendErrorCode(400, toErrorString: &error)
//print(error)

//8 regresar un valor de una funcion
//func welcomeMessage(to name: String) -> String{
//    print("before retunr")
//    return "Welcome \(name)"
//}
//
//let message = welcomeMessage(to: "Carlos")
//print(message)

//func welcomeMessage(to name: String) -> String{
//    return "Welcome \(name)"
//}
//
//print(welcomeMessage(to: "Carlos"))


//Scope

func areOfTriangleWith(base: Double, height: Double) -> Double{
    let rectangle = base + height
    
    func divide() -> Double{
        return rectangle/2
    }
    
    return divide()
}

print(areOfTriangleWith(base: 3, height: 5))

//regresar mas de un valor
func sortedEvenOddNumbers (_ numbers: [Int]) -> (evens: [Int],odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers{
        if number % 2 == 0{
            evens.append(number)
        } else{
            odds.append(number)
        }
    }
    
    return (evens: evens, odds: odds)
}

let aBuchOfNumbers = [10,1,4,3,57,43,27,84]

let sortedEvenAndOddNumbers  = sortedEvenOddNumbers(aBuchOfNumbers)
print("The even numbers are: \(sortedEvenAndOddNumbers.evens)")
print("The even numbers are: \(sortedEvenAndOddNumbers.odds)")


let myFunction: ([Int]) -> ([Int], [Int]) = sortedEvenAndOddNumbers
myFunction([])


//funciones con opcionales

func grabMiddleName(fullName name: (first: String, middle: String?, Last: String)) -> String?{
    
    return name.middle
    
}

let middleName = grabMiddleName(fullName: (first: "Carlos", middle: nil, Last: "Rangel"))

if let middleName = middleName{
    print(middleName)
}


//Terminar antes la funcion

func greetByMiddleName(fromFullName name: (first: String, middle: String?, Last: String)){
    
    guard let middleName = name.middle else{
        print("Hey there!")
        return
    }
    
    print("Hey, \(middleName)")
}

greetByMiddleName(fromFullName: (first: "Carlos", middle: nil, Last: "Rangel"))

//varias condiciones

//func greetByMiddleName(fromFullName name: (first: String, middle: String?, Last: String), age: Int){
//
//    guard let middleName = name.middle, age > 18 else{
//        print("Hey there!")
//        return
//    }
//
//    print("Hey, \(middleName)")
//}
//
//greetByMiddleName(fromFullName: (first: "Carlos", middle: "Rangel", Last: "Rangel"), age: 15)


