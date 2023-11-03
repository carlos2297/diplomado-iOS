//
//  CancionesController.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class CancionesController: UIViewController {
    @IBOutlet weak var songsTable: UITableView!
    
    
    var selectedAlbum = ""
    var dataSong = TableSongModel()
    
    
    func customSongs() {
        switch selectedAlbum {
            case "Bahia Ducati":
                        dataSong.addDataToArray(songName: "enemigos", time: "3:37")
                        dataSong.addDataToArray(songName: "FOTOGRAFÍAS", time: "3:24")
                        dataSong.addDataToArray(songName: "JAMAICA", time: "3:44")
                        dataSong.addDataToArray(songName: "FERXXO X ÑEJO", time: "3:35")
                        dataSong.addDataToArray(songName: "PORFA - Remix", time: "5:33")
            case "Un Verano Sin Ti":
            dataSong.addDataToArray(songName: "Moscow Mule", time: "4:05")
                        dataSong.addDataToArray(songName: "Me Porto Bonito", time: "2:58")
                        dataSong.addDataToArray(songName: "Tarot", time: "3:57")
                        dataSong.addDataToArray(songName: "Efecto", time: "3:33")
                        dataSong.addDataToArray(songName: "Party", time: "347")
            case "GENESIS":
            dataSong.addDataToArray(songName: "ROSA PASTEL", time: "3:24")
                        dataSong.addDataToArray(songName: "LUNA", time: "2:43")
                        dataSong.addDataToArray(songName: "77", time: "3:35")
                        dataSong.addDataToArray(songName: "CARNAL", time: "2:54")
                        dataSong.addDataToArray(songName: "LAS MORRAS", time: "2:35")
                        dataSong.addDataToArray(songName: "LADY GAGA", time: "3:32")
                        dataSong.addDataToArray(songName: "ZAPATA", time: "2:57")
                        dataSong.addDataToArray(songName: "PRC", time: "3:04")
                        dataSong.addDataToArray(songName: "NUEVA VIDA", time: "3:10")
            default:
                print("No hay canciones")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedAlbum)
        customSongs()
        songsTable.dataSource = self
        songsTable.delegate = self
        songsTable.sectionHeaderTopPadding = 0
        
        // Do any additional setup after loading the view.
    }
}

extension CancionesController:UITableViewDataSource {
    
    //Numero de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        dataSong.getCountArray()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = selectedAlbum
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    //indexPath es una variable que tiene la posicion de la columna y la seccion
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = songsTable.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                    cell?.backgroundColor = .darkGray
                    cell?.accessoryType = .disclosureIndicator
                }
        cell?.textLabel?.text = dataSong.getSongName(index: indexPath)
        cell?.detailTextLabel?.text = dataSong.getTime(index: indexPath)
        cell?.detailTextLabel?.textColor = .white
        cell?.textLabel?.textColor = .white
        
        return cell!
    }
    
    
}

extension CancionesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

}
