//: [Previous](@previous)

import Foundation

for i in 1...5 {
    print(i)
}


let numbers = [1,3,5,7]

for number in numbers {
    print(number)
}


//antes de 20
let intervals = stride(from: 0,to: 20, by:5)
for i in intervals{
    print(i)
}
//hasta 60

//3
let intervals2 = stride(from: 0,through: 60, by:15)
for i in intervals2{
    print(i)
}

let pokemons = ["Fire":"Charmander","Water":"Mudkip"]

for (type,name) in pokemons {
    print("I like \(name) of type \(type)")
}

for poke in pokemons {
    print("I like \(poke.value) of type \(poke.key)")
}


let names: Set = ["James","Dean"]
print("For-in loop")
var index = 0
for _ in names{
    print(index)
    index += 1
}

let names2 = ["James","Dean"]
for(index2, name) in names2.enumerated(){
    print(index2, name)
}


for (index, pokemons) in pokemons.enumerated()
{
    print("\(index),\(pokemons)")
}

for(index,(type,name)) in pokemons.enumerated(){
    print("\(index),\(type),\(name)")
}

for(index, name) in names.enumerated(){
    if index % 2 == 0{
        print(name)
    }
    print(index)
}

for(index, name) in names.enumerated(){
    if index % 2 == 0{
        continue
    }
    print(name)
}
//: [Next](@next)

for poke in pokemons where poke.key == "Fire"
{
    print(poke.value)
}


var counter = 1
while counter < 10{
    counter += 1
}

counter = 1

repeat{
    print(counter)
    counter += 1
}while counter < 10
        

