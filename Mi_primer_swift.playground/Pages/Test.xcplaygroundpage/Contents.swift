//: [Previous](@previous)

import XCTest

class MyTest: XCTestCase {
    
    func getFullName(_ nameTuple:(String,String?,String,String?)) -> String{
         
        var nombre = [nameTuple.0,(nameTuple.1 ?? ""), nameTuple.2,(nameTuple.3 ?? "")]
    
        var result = [String]()
        
        for word in nombre{
            if word != ""{
                result.append(word)
            }
        }
        
        return result.joined(separator: " ")
        
    }
    
    func test_GetFullName(){
        //given
        let firstPerson: (String,String?,String,String?) = (first: "Carlos", second:"Alberto", firstLastName:"Rangel", secondLastName: "Garcia")
        let secondPerson: (String,String?,String,String?) = (first: "Carlos", second:nil, firstLastName:"Rangel", secondLastName: nil)
        //when
        let firstFullName = getFullName(firstPerson)
        let secondFullName = getFullName(secondPerson)
        //then
        XCTAssertEqual(firstFullName,"Carlos Alberto Rangel Garcia")
        XCTAssertEqual(secondFullName,"Carlos Rangel")
    }
}

MyTest.defaultTestSuite.run()
//: [Next](@next)
