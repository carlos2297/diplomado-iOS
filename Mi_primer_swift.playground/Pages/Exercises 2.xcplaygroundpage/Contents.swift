import Foundation

let animal: String = "dog"


switch animal {
case "dog": print("🐶")
case "cat": print("😹")
case "mouse": print("🐭")
case "bird": print("🐣")
default: break
}

//caso compuesto

switch animal {
case "dog", "cat" :
    print("A mi me gustan mucho esos")
case "mouse": print("🐭")
case "bird": print("🐣")
default: break
}

let grade = 9

switch grade {
case ...5 : print ("Failed")
case 6..<9 : print ("Meh")
case 9 : print ("Great!")
case 10 : print ("WOW")
default: print(":v")
}


let color = (255,255,255)

switch color {
case (_, _, 255) : print ("max blue")
    fallthrough
case (_, 255, _) : print ("max green")
    fallthrough
case (255, _, _) : print ("max red")
    fallthrough
default: break
}

//value biding

let color2 = (2,5,255)

switch color2 {
case let (255,g,b) where g < 255:
  print("max red with green \(g) and blue \(b)")
case (let r,  let g , 255) : print ("red: \(r), green \(g), max blue")
case let (r,255,b) : ("red: \(r),max green, blue:\(b)")
default: break
}

let rango = (0,7)

switch rango {
case (0,0): print("origen")
case(let x,0): print ("Estas en el eje X  en la cordenada (\(x),0)")
case(0,let y): print ("Estas en el eje Y  en la cordenada (0,\(y))")
case (1...5,1...5) : print("Cuadrante 1")
case (-5..<0,1...5) : print("Cuadrante 2")
case (-5..<0,-5..<0) : print("Cuadrante 3")
case (1...5,-5..<0) : print("Cuadrante 4")
default: break
}


guard animal == "dog" else {
    fatalError("It's not a dog")
}
print(animal)
