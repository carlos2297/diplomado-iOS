//
//  PokemonModel.swift
//  collectionTableView
//
//  Created by Diplomado on 10/11/23.
//

import Foundation

struct PokemonModel: Codable {
    var name: String
    var number: String
    var detail: String
    var types: [String]
    var chain: [String]
    
}

class TablePokemonModel {
    
    var rowsArray: [PokemonModel]
    
    init() {
        rowsArray = []
    }
    
    func getCountArray() -> Int {
        rowsArray.count
    }
    
    func getName(index: IndexPath) -> String {
        rowsArray[index.row].name
    }
    func getNumber(index: IndexPath) -> String {
        rowsArray[index.row].number
    }
    func getTypes(index: IndexPath) -> [String] {
        rowsArray[index.row].types
    }
    func getDetail(index: IndexPath) -> String {
        rowsArray[index.row].detail
    }
    func getChain(index: IndexPath) -> [String] {
        rowsArray[index.row].chain
    }
    
    func getSections () ->  Int {
        1
    }
    
    func getSectionTitle () -> String {
        "Pokemons"
    }
    
    func addDataToArray (name:String,number: String, detail: String,types:[String],chain: [String]){
        rowsArray.append(PokemonModel(name: name,number: number,detail: detail,types: types,chain: chain))
    }
    
    func addDataToArray2(pokemon: PokemonModel){
        rowsArray.append(pokemon)
    }
}
