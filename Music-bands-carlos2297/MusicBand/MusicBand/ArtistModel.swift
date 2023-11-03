//
//  ArtistModel.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import Foundation

struct ArtistModel {
    var band: String
    var genero: String
}

class TableArtistModel {
    var rowsArray: [ArtistModel]
    
    init() {
        rowsArray = [
            ArtistModel(band: "Feid", genero: "Reggaeton"),
            ArtistModel(band: "Bad Bunny", genero: "Reggaeton"),
            ArtistModel(band: "Peso Pluma", genero: "Regional Mexicano"),
    
        ]
    }
    func getCountArray() -> Int {
        rowsArray.count
    }
    
    //Necesitamos saber en que posicion estamos
    func getBand(index: IndexPath) -> String {
        rowsArray[index.row].band
    }
    
    func getGenero(index: IndexPath) -> String {
        rowsArray[index.row].genero
    }
    
    func getSections () ->  Int {
        1
    }
    
    func getSectionTitle () -> String {
        "Artistas"
    }
}


