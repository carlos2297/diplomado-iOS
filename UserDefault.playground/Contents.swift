import UIKit

var greeting = "Hello, playground"


let defaults = UserDefaults.standard


//guardar dato


defaults.set(5, forKey: "Entero")
defaults.setValue("String", forKey: "String")
defaults.setValue(["Uno","Dos"], forKey: "Array")


//recuperar dato

let numero = defaults.object(forKey: "Entero")
let numeroDos = defaults.integer(forKey: "Entero")
defaults.integer(forKey: "String")
defaults.array(forKey: "Array")

numeroDos + 3
numero as! Int + 3

struct myStruct: Codable {
    var variableUno: String
    var VariableDos: Int
    
}
let myArray = [myStruct(variableUno: "Uno", VariableDos: 2),myStruct(variableUno: "Dos", VariableDos: 2)]

//Guardar Dato

if let encodeData = try? JSONEncoder().encode(myArray){
    
    defaults.setValue(encodeData, forKey: "myArrayKey")
    
}

//Recuperar dato
if let savedData = defaults.data(forKey:"myArrayKey"),let decodeArray = try? JSONDecoder().decode([myStruct].self, from: savedData){
    print(decodeArray[0].variableUno)
}else {
    
}



