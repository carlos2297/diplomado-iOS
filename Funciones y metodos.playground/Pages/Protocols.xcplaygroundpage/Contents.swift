//: [Previous](@previous)
import UIKit

// PROTOCOLOS

//Nos permiten encapsular caracteristicas del codigo para poder utilizarlos mas adelante
//Permiten definir una interfaz,

//Definición de protocolo:

protocol TabularDataSource: CustomStringConvertible {
    var numberOfRows: Int { get }
    var numerOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}


let data = [
    ["Eva", "30", "6"],
    ["Saleh", "40", "18"],
    ["Amit", "50", "20"]
]

func printTable(_ dataSource: TabularDataSource){
    var headerRow = "|"
    var columnWidths = [Int]()
    
   // for columnLabel in columnLabels {
    for index in 0..<dataSource.numerOfColumns {
        let columnLabel = dataSource.label(forColumn: index)
        let columnHeader = "\(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(headerRow)
    
    for index in 0..<dataSource.numberOfRows{
        //Start output string
        var output = "|"
        
        for columnIndex in 0..<dataSource.numerOfColumns {
            let item = dataSource.itemFor(row: index, column: columnIndex)
            let paddingNeeded = columnWidths[columnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
        
        print(output)
    }
}

//printTable(data, withColumHeaders: ["Employee name", "Age", "Years of experience"])


struct Person{
    let name: String
    let age : Int
    let yearsOfExperience: Int
}

//Custom

struct Department: TabularDataSource, CustomStringConvertible{
    
    let name: String
    var people = [Person]()
    
    var description: String{
        return "Deparment: \(name)"
    }
    
    
    init(name: String){
        self.name = name
    }
    
    mutating func add(_ person: Person){
        people.append(person)
    }
    
    var numberOfRows: Int{ people.count }
    var numerOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let columnHeader: String
        switch column {
        case 0:
            columnHeader = "Employye name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader = "Years of experience"
        default: fatalError("Invalidad column header index")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column{
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalidad column for person!")
        }
    }
}

var deparment = Department(name: "Engineering")
deparment.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
deparment.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
deparment.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(deparment)
print(deparment)

let operations: TabularDataSource =
    Department(name: "Other department")

let engineeringDataSource = deparment as TabularDataSource

//let testPerson = Person(name: "Alejandro", age: 27, yearsOfExperience: 5)
//
//deparment is TabularDataSource


protocol Student: CustomStringConvertible {
    
    var accountNumber: Int {get}
    var name: String {get}
    
}


struct EngineeringStudent: Student {
    var description: String{
        "Medicine Student - \(name)"
    }
    var accountNumber: Int
    var name: String
    let hasCalculator: Bool
    
    
}


let engineeringStudent = EngineeringStudent(accountNumber: 313008836, name: "Carlos", hasCalculator: false)


struct MedicineStudent: Student{
    
    var description: String{
        "Medicine Student - \(name)"
    }
    var accountNumber: Int
    var name: String
    
    let hasLabCoat: Bool
}


let medicineEstudent = MedicineStudent(accountNumber: 11112222, name: "Mariana", hasLabCoat: true)

func printStudentInformation(_ student: Student){
    print("\(student.name) - \(student.accountNumber)")
    
    if let medicineStudent = student as? MedicineStudent {
        print(medicineStudent.hasLabCoat)
    }
}


printStudentInformation(engineeringStudent)
printStudentInformation(medicineEstudent)



//: [Next](@next)
