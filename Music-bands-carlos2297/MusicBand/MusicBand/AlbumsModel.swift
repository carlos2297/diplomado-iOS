//
//  Albums, Model.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import Foundation

struct AlbumModel {
    var albumName: String
    var year: String
}

class TableAlbumsModel {
    var rowsArray: [AlbumModel] = []
    
    func getCountArray() -> Int {
        rowsArray.count
    }
    
    //Necesitamos saber en que posicion estamos
    func getAlbumName(index: IndexPath) -> String {
        rowsArray[index.row].albumName
    }
    
    func getYear(index: IndexPath) -> String {
        rowsArray[index.row].year
    }
    
    func getSections () ->  Int {
        1
    }
    
    func getSectionTitle () -> String {
        "Albums"
    }
    
    func addDataToArray (albumName:String ,yearAlbum: String){
        rowsArray.append(AlbumModel(albumName: albumName, year: yearAlbum))
    }
}


