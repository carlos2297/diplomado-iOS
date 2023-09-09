import UIKit

//sintaxys de comentarios de una sola linea


/*comentarios para un seccio
 de varios renglones
 */

var greeting = "Hello, playground"
let contante = "Hola mundo"

greeting = "hola"

//Entero
//Doble
//String
//Booleano


var n1 = 3, n2 = 3

var doble = 3.0
var booleano = true

var miEnteroUno: Int = 1
var miDoble: Double = 3.0


var miString: String = "hola"
var miBoleano: Bool = true

var miSegundoEntero: Int

var numeroUno = 0.1
var numeroDos = 0.2

print(numeroUno + numeroDos)

numeroUno += numeroDos
numeroUno -= numeroDos
numeroUno - numeroDos
numeroUno * numeroDos
numeroUno / numeroDos

numeroUno > numeroDos
numeroUno < numeroDos

numeroUno >= numeroDos
numeroUno <= numeroDos
numeroUno == numeroDos
numeroUno != numeroDos

var edad = 25
var nombre = "Carlos"

"hola, soy \(nombre) y tengo \(edad) años"

//arreglos
//colecciones ordenadas que tienen un indice
//y acepta elementos repetidos

var array = [1,2,3,4,5]
var array2 = ["pedro","ali","carlos"]

var array3:[String] = ["pedro","ali","carlos"]


array3[2]
array.append(3)
array += [1,2,3,4]


//set
//no valores repetidos y colecciones no ordenadas


var miset: Set<String> = ["pedro","ali","carlos"]

miset.insert("Paolo")

miset.contains("paco")



//diccionarios
//


var miDiccionario: [String:String] = [:]

var miDiccionarioDos = ["Nombre":"Grecia", "Edad":"18"]

miDiccionarioDos["ColorFavorito"] = "Rojo"

miDiccionarioDos

miDiccionarioDos["Nombre"]

//tuplas

var color = ("rojo", "0#fff")


var alumnoDos = (Nombre:"dante sanchez",Edad: 8)


alumnoDos.Nombre
alumnoDos.Edad

//secuencial

var saludo = "hello"

print(saludo)

//condicional
//if

let animal = "dog"

if animal == "dog" {
    print("it's a dog!!")
}else{
    print("Nor a dog :(")
}

if !(animal == "dog"){
    print("it's a dog!!")
}else{
    print("Nor a dog :(")
}

if animal.count <= 4 {
    print("Menos a 4 letras")
}else {
    print("mayor a 4 letras")
}


if #unavailable(iOS 15.0){
    //para Anteriores
}


//Ternario

var number = 3

number == 2 ? print("It's 2!") : print("Some other number")

var value = number == 2 ? number : 4




var weather = "lluvia"
var time = 1
//1
//close_range
var dark = Array(0...6) + Array(19...23)
print(dark)
var ligth = 7...18
print(ligth)

if weather == "lluvia"{
    print("🌧️")
}else if weather == "nieve"{
    print("🌨️")
}

//~ operador contiene

if  ligth ~= time {
    print("Usa bloqueador")
}else if dark.contains(time) {
    print("No necesitas bloqueador")
}

