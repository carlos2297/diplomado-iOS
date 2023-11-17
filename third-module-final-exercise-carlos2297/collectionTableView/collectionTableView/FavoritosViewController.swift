//
//  FavoritosViewController.swift
//  collectionTableView
//
//  Created by Diplomado on 10/11/23.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var name = ""
    
    var detail = ""
    
    var pokeInfo = [[String]]()

    var filterArray = TablePokemonModel()
    
    var favoritosStruc = [PokemonModel]()
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let savedPokemon = defaults.object(forKey: "SavePokemon") as? Data {
            let decoder = JSONDecoder()
            if let loadedPokemon = try? decoder.decode([PokemonModel].self, from: savedPokemon) {
                
                favoritosStruc = loadedPokemon
                
                filterArray = TablePokemonModel()
                
                for pokemon in favoritosStruc{
                    
                    filterArray.addDataToArray2(pokemon: pokemon)
                }
    
            }
        }
        
       tableView.reloadData()
    }

}


extension FavoritosViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterArray.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filterArray.getName(index: indexPath)
        
        cell?.detailTextLabel?.text = filterArray.getNumber(index: indexPath)
        cell?.detailTextLabel?.textColor = .systemBlue
        
        cell?.imageView?.image = UIImage(named: filterArray.getName(index: indexPath))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Eliminar de favoritos"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            filterArray.rowsArray.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(filterArray.rowsArray) {
                    defaults.set(encoded, forKey: "SavePokemon")
            }           
            
            tableView.reloadData()
        }
    }

}

extension FavoritosViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = filterArray.getName(index: indexPath)
        detail = filterArray.getDetail(index: indexPath)
        pokeInfo = [[filterArray.getName(index: indexPath)],[filterArray.getNumber(index: indexPath)],filterArray.getTypes(index: indexPath),filterArray.getChain(index: indexPath)]
        performSegue(withIdentifier: "ToPokeInfo", sender: nil)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToPokeInfo" {
                if let destinationVC = segue.destination as? PokeInfoController {
                    destinationVC.name = name
                    destinationVC.dataArray = pokeInfo
                    destinationVC.detail = detail
                }
            }
        }
}
