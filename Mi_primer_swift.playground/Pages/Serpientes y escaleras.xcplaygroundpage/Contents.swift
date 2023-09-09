//: [Previous](@previous)

//4
import Foundation

let tablero = [13: 3, 18: 7, 21: 10, 23: 15,2: 10, 5: 16, 8: 17, 9: 11]
var dado: Int
var posicion: Int = 0
var contador: Int = 0

while posicion < 24
{
  
dado = Int.random(in: 1...6)

print("dado: \(dado)")
  
contador += 1
  
posicion = posicion + dado
  
print("posicion: \(posicion)")

if (tablero.contains{$0.key == posicion}) {

    posicion = (tablero[posicion])!
    print("Nueva posicion: \(posicion)")
}

}

print("Ganaste con \(contador) tiros")

