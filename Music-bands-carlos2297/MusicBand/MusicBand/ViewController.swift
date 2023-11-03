//
//  ViewController.swift
//  MusicBand
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class ViewController: UIViewController {
    let artistas = TableArtistModel()
    @IBOutlet weak var artistTable: UITableView!{
        didSet{
            artistTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    var band = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        artistTable.delegate = self
        artistTable.dataSource = self
        artistTable.sectionHeaderTopPadding = 0
    }
}

extension ViewController:UITableViewDataSource {
    //Numero de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artistas.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = artistas.getSectionTitle()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    //indexPath es una variable que tiene la posicion de la columna y la seccion
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = artistTable.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//                    cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//                    cell?.backgroundColor = .darkGray
//                    cell?.accessoryType = .disclosureIndicator
//                }
//        
//        cell?.textLabel?.text = artistas.getBand(index: indexPath)
//        cell?.detailTextLabel?.text = artistas.getGenero(index: indexPath)
//        cell?.detailTextLabel?.textColor = .white
//        cell?.textLabel?.textColor = .white
        cell?.artistaLabel.text = artistas.getBand(index: indexPath)
        cell?.generoLabel.text = artistas.getGenero(index: indexPath)
        cell?.artistaImage.image = UIImage(named: artistas.getBand(index: indexPath))
        
        return cell!
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(artistas.getBand(index: indexPath))
        band = artistas.getBand(index: indexPath)
        performSegue(withIdentifier: "ToAlbums", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToAlbums" {
                if let destinationVC = segue.destination as? AlbumsController {
                    destinationVC.selectedBand = band // Asignar la banda seleccionada a una propiedad en la vista de destino
                }
            }
        }
}

