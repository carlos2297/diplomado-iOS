//: [Previous](@previous)

import Foundation

enum Pet: String {
    case dog = "🐶"
    case cat = "😹"
    case parakeet = "🦜"
    case turtle = "🐢"
    
    var type: String {
        switch self{
        case .dog, .cat: return "mamifero"
        case .turtle: return "reptiel"
        case .parakeet: return "ave"
        }
    }
    
    init?(name: String){
        switch name {
        case "dog": self.init(rawValue: "🐶")
        default: return nil
        }
    }
}

let myPet = Pet(rawValue: "🦜")
let myTurtle: Pet = .turtle
let myParakeet = Pet.parakeet.type



switch myPet{
case .dog: print("🦜")
default: print(myPet!.rawValue)
}
//: [Next](@next)

enum ContacMethod {
    case email(String)
    case phone(Int)
    case mail(streetName:String,zipCode:String,streetNumber:Int)
}

var myPreferredContactMethod = ContacMethod.email("myemail@mail.com")

switch myPreferredContactMethod {
case .email(let strEmail): print(strEmail)
case .phone(let num):print(num)
case .mail(streetName: let name, zipCode: let zc, streetNumber: let num):
    print("Addres Street \(name) \(num) \(zc)")
}


//5
//Recursividad en enumeradores
//(6+(4*(8-1))/2

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case sustract(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication (ArithmeticExpression , ArithmeticExpression)
    indirect case division (ArithmeticExpression , ArithmeticExpression)
}

//  (5+4)
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let six = ArithmeticExpression.number(6)
let two = ArithmeticExpression.number(2)
let one = ArithmeticExpression.number(1)
let eigth = ArithmeticExpression.number(8)

let res = ArithmeticExpression.sustract(eigth, one)
let product = ArithmeticExpression.multiplication(res , four)
let sum = ArithmeticExpression.addition(six, product)
let div = ArithmeticExpression.division(sum, two)

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let number): return number
    case .addition(let leftExp, let rightExp): return evaluate(expression: leftExp) + evaluate(expression: rightExp)
    case .sustract(let leftExp, let rightExp): return evaluate(expression: leftExp) - evaluate(expression: rightExp)
    case .multiplication(let leftExp, let rightExp): return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    case .division(let leftExp, let rightExp): return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    }
}


evaluate(expression: div)


//Estruturas y Clases


//Por valor no referencida
struct Car {
    var wheels: Int
    var color: String
    
}


//Referenciada
class Car2 {
    var wheels: Int
    var color: String
    
    init(wheels: Int, color: String){
        self.wheels = wheels
        self.color = color
    }
}


//No se puede cambiar cuando es let - Struct -
let myCar = Car(wheels:4, color: "Black")

//Se puede cambiar aunque sea let - Class -
let myCar2 = Car2(wheels:4, color: "Black")
myCar2.color = "Blue"


//es referenciado si creas una copia se cambia en las dos - Class -
let copyOfMyCar2 = myCar2
copyOfMyCar2.color = "Red"

print(copyOfMyCar2.color)
print(myCar2.color)

class Vehicle {
    
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    var wheels: Int?
    
    var type: String {
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (name: String, serialNumber: String, type: String)? {
        get {
            if let owner = owner{
                return(owner,serialNumber, type)
            }
            return nil
        }
        
        set(newRegistration){
            if let newRegistration = newRegistration{
                owner = newRegistration.name
            }
        }
    }
    
    init(brand: String,model:String,serialNumber:String){
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
    }
    
    var isMoving: Bool = false
    
    func move(){
        isMoving = true
    }
    func stop(){
        isMoving = false
    }
    
    static func describe(){
        print("a Vehicle")
    }
    
    func makeNoise() -> String{ "Noise" }
}


let myVehicle = Vehicle(brand: "mazda", model: "3", serialNumber: "123456")

myVehicle.registration = (name: "Carlos", serialNumber: "12236363", type: "other")

myVehicle.move()
myVehicle.isMoving
Vehicle.describe()

class Carro: Vehicle{
    
    override var type: String{
        return "Car"
    }
    
    var isElectric: Bool
    
    //primero la actual despues la super siempre verificar que las dos clases esten completas
    init(electric: Bool){
        self.isElectric = electric
        super.init(brand: "Tesla", model: "model s", serialNumber: "11111111")
    }
    
    //para sobreescribir la funcion que ya heredo si no ocuparia la default
    override func makeNoise() -> String {"BRRR"}
    
    init(brand: String, model: String, serialNumber: String,
         isElectric: Bool) {
        self.isElectric = isElectric
        super.init(brand: brand, model: model, serialNumber: serialNumber)
    }
    
    convenience init(suzukiModel model: String, serialNumber: String,isElectric: Bool, boughtBy name:String){
        self.init(brand: "Suzuki", model: model, serialNumber: serialNumber, isElectric: isElectric)
        owner = name
    }
    
    override var brand: String{
        willSet (newBrand) { // Dato nuevo
           print("my new brand is \(newBrand)")
        }
        didSet {//Dato anterior
            //Tiene valor por default la variable "oldValue"
            print("My old brand was \(oldValue)")
        }
        
    }
    
}


let myCarro = Carro(electric: true)
myCarro.isElectric
myCarro.brand
myCarro.makeNoise()
let myCarro2 = Carro(brand: "suzuki", model: "swift", serialNumber: "222222", isElectric: false)

myCarro2.brand = "Tesla"



//struct Dog {
//    var name: String
//    var isAdopted: Bool
//    var color: String
//}
//
//let Ali = Dog(name: "Ali", isAdopted: true)
//
////la copia no modifica la original
//
//var AliClone = Ali
//AliClone.isAdopted = false
//
//print(Ali.isAdopted)
//print(AliClone.isAdopted)
//
////No se puede
//
////Ali.name = "Juan"
//
//
////Clases pueden heredar
//
//class Vehicle{
//    var wheels: Int?
//
//    //los inicializadores se heredan
//    init(wheels: Int){
//        self.wheels = wheels
//    }
//}

/*
class Scooter: Vehicle {
    
    var color: String
    
    init(color: String = "Blue") {
        self.color = color
    }
}

let myVehicle = Scooter()

myVehicle.color */


struct Dog {
    
    var isAdopted:Bool = true
    let color:String
    
    var name:String {
        willSet (newName) { // Dato nuevo
           print("my new name is \(newName)")
        }
        didSet {//Dato anterior
            //Tiene valor por default la variable "oldValue"
            print("My old name was \(oldValue)")
        }
    }
    
    static let amountOfPaws = 4
    var paws:Int = 4
    var specialNeeds:Bool {
        paws != Dog.amountOfPaws
    }

    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    mutating func changeName (newName: String) {
        name = newName
    }
    static func describeADog() -> String {
        "Dogs are really cute animals!"
    }
    
    init(name: String, isAdopted: Bool, color:String){
        self.name = name
        self.isAdopted = isAdopted
        self.color = color
    }
    
    init(adopted name:String, color:String){
        self.name = name
        self.isAdopted = true
        self.color = color
    }
    init(bought name:String, color:String){
        self.init(name: name, isAdopted: false, color: color)
    }
    init(){
        self.init(adopted: "Milaneso", color: "Brown")
    }
    
}


//var myDog = Dog(color:"brown", name:"Milaneso")
var myDog = Dog(name: "Milaneso", isAdopted: true, color: "Brown")

myDog.paws = 3
//myDog.especialNeeds
myDog.getID()
myDog.changeName(newName: "Solovino")
Dog.amountOfPaws
Dog.describeADog()



