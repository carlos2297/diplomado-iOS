//
//  TypesModel.swift
//  collectionTableView
//
//  Created by Diplomado on 10/11/23.
//

import Foundation

struct TypesModel {
    var name: String
    var Ddealt: [String]
    var Drecive: [String]
    var Hdealt: [String]
    var Hrecive: [String]
    var Notby: [String]
    var Notagain: [String]
}

class TableTypesModel {
    
    var rowsArray: [TypesModel]
    
    init() {
        rowsArray = [TypesModel(name:"Fuego", Ddealt: ["Hielo","Tierra","Roca"], Drecive: ["Hielo","Agua","Roca"], Hdealt: ["Agua","Tierra","Roca"], Hrecive: ["Hielo","Agua","Roca"], Notby: ["Normal","Fuego","Siniestro"], Notagain: ["Agua","Tierra","Roca"]),TypesModel(name:"Agua", Ddealt: ["Fuego","Tierra","Roca"], Drecive: ["Electrico","Planta"], Hdealt: ["Electrico","Planta"], Hrecive: ["Fuego","Tierra","Roca"], Notby: ["Bicho","Veneno","Roca"], Notagain: ["Fuego","Tierra","Roca"]),TypesModel(name:"Planta", Ddealt: ["Agua","Tierra","Roca"], Drecive: ["Fuego","Volador","Hielo"], Hdealt: ["Fuego","Volador","Hielo"], Hrecive: ["Agua",",Tierra","Roca"], Notby: ["Bicho","Veneno","Siniestro"], Notagain: ["Fuego","Volador","Hielo"])]
    }
    
    func getCountArray() -> Int {
        rowsArray.count
    }
    
    func getName(index: IndexPath) -> String {
        rowsArray[index.row].name
    }
    func getDealt(index: IndexPath) -> [String] {
        rowsArray[index.row].Ddealt
    }
    func getDrecive(index: IndexPath) -> [String] {
        rowsArray[index.row].Drecive
    }
    func getHrecive(index: IndexPath) -> [String] {
        rowsArray[index.row].Hrecive
    }
    func getHdealt(index: IndexPath) -> [String] {
        rowsArray[index.row].Hdealt
    }
    func getNotby(index: IndexPath) -> [String] {
        rowsArray[index.row].Notby
    }
    func getNoagain(index: IndexPath) -> [String] {
        rowsArray[index.row].Notagain
    }
    func getSections () ->  Int {
        1
    }
    
    func getSectionTitle () -> String {
        "Types"
    }
    
}
