//
//  AlbumsController.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class AlbumsController: UIViewController {
    @IBOutlet weak var tableAlbums: UITableView!
    
    var selectedBand = ""
    var dataAlbum = TableAlbumsModel()
    var album = ""
    
    func customAlbum() {
        switch selectedBand {
            case "Feid":
                dataAlbum.addDataToArray(albumName: "Bahia Ducati", yearAlbum: "2020 ➝ Album")
            case "Bad Bunny":
                dataAlbum.addDataToArray(albumName: "Un Verano Sin Ti", yearAlbum: "2022 ➝ Album")
            case "Peso Pluma":
                dataAlbum.addDataToArray(albumName: "GENESIS", yearAlbum: "2023 ➝ Album")
        
            default:
                print("No hay album")
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Banda Seleccionada \(selectedBand)")
        customAlbum()
        tableAlbums.dataSource = self
        tableAlbums.delegate = self
        tableAlbums.sectionHeaderTopPadding = 0
        // Do any additional setup after loading the view.
    }

}

extension AlbumsController:UITableViewDataSource {
    
    //Numero de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataAlbum.getCountArray()
        
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//    }
    //indexPath es una variable que tiene la posicion de la columna y la seccion
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = dataAlbum.getSectionTitle()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableAlbums.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                    cell?.backgroundColor = .darkGray
                    cell?.accessoryType = .disclosureIndicator
                }
        cell?.textLabel?.text = dataAlbum.getAlbumName(index: indexPath)
        cell?.detailTextLabel?.text = dataAlbum.getYear(index: indexPath)
        cell?.detailTextLabel?.textColor = .white
        cell?.textLabel?.textColor = .white
        return cell!
    }
    
    
}

extension AlbumsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataAlbum.getAlbumName(index: indexPath))
        album = dataAlbum.getAlbumName(index: indexPath)
        performSegue(withIdentifier: "ToSongs", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToSongs" {
                if let destinationVC = segue.destination as? CancionesController {
                    destinationVC.selectedAlbum = album // Asignar la banda seleccionada a una propiedad en la vista de destino
                }
            }
        }
}

