//
//  SongsModel.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import Foundation

struct SongModel {
    var songName: String
    var time: String
}

class TableSongModel {
    var rowsArray: [SongModel] = []
    
    func getCountArray() -> Int {
        rowsArray.count
    }
    
    //Necesitamos saber en que posicion estamos
    func getSongName(index: IndexPath) -> String {
        rowsArray[index.row].songName
    }
    
    func getTime(index: IndexPath) -> String {
        rowsArray[index.row].time
    }
    
    func getSections () ->  Int {
        1
    }
    
    func getSectionTitle () -> String {
        "Canciones"
    }
    
    func addDataToArray (songName:String ,time: String){
        rowsArray.append(SongModel(songName: songName, time: time))
    }
}



