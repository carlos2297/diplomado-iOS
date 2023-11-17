//
//  ViewController.swift
//  collectionTableView
//
//  Created by Eric Rojas Pech on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
        
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataArray = TablePokemonModel()
    
    var filterArray = TablePokemonModel()
    
    var favorites = [PokemonModel]()
    
    var name = ""
    
    var detail = ""
    
    var pokeInfo = [[String]]()
   
    let defaults = UserDefaults.standard
    
//   [PokemonModel(name: "Bulbasaur", number: 001,detail:"Un Pokémon de tipo Planta que parece una rana. Sus semillas brotan de su espalda",types: ["Planta","Veneno"], chain: ["Bulbasaur","Ivysaur","Venusaur"]),PokemonModel(name: "Charmander", number: 004, detail: "Un Pokémon de tipo Fuego que parece una lagartija. Su cola siempre está ardiendo", types: ["Fuego"], chain: ["Charmander","Charmeleon","Charizard"]),PokemonModel(name: "Squirtle", number: 007, detail: "Un Pokémon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente", types: ["Agua"], chain: ["Squirtle","Wartortle","Blastoise"])]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        dataArray.addDataToArray(name: "Bulbasaur", number:"001",detail:"Un Pokémon de tipo Planta que parece una rana. Sus semillas brotan de su espalda",types: ["Planta","Veneno"], chain: ["Ivysaur","Venusaur"])
        dataArray.addDataToArray(name: "Charmander", number: "004", detail: "Un Pokémon de tipo Fuego que parece una lagartija. Su cola siempre está ardiendo", types: ["Fuego"], chain: ["Charmeleon","Charizard"])
        dataArray.addDataToArray(name: "Squirtle", number: "007", detail: "Un Pokémon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente.", types: ["Agua"], chain: ["Wartortle","Blastoise"])
        
        filterArray = dataArray
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self

        
        
        if let savedPokemon = defaults.object(forKey: "SavePokemon") as? Data {
            let decoder = JSONDecoder()
            if let loadedPokemon = try? decoder.decode([PokemonModel].self, from: savedPokemon) {
                favorites = loadedPokemon
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let savedPokemon = defaults.object(forKey: "SavePokemon") as? Data {
            let decoder = JSONDecoder()
            if let loadedPokemon = try? decoder.decode([PokemonModel].self, from: savedPokemon) {
                favorites = loadedPokemon
            }
        }
        
    }
    
    @IBAction func sortButton(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterArray.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = filterArray.getName(index: indexPath)
        
        cell?.detailTextLabel?.text = filterArray.getNumber(index: indexPath)
        cell?.detailTextLabel?.textColor = .systemBlue
        
        cell?.imageView?.image = UIImage(named: filterArray.getName(index: indexPath))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Agregar a favoritos"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //Regresa un booleno si encuentra una structura con la condicion que se manda
            if !(favorites.filter{$0.name == filterArray.getName(index: indexPath)}.count > 0){
            
            favorites.append(filterArray.rowsArray[indexPath.row])
            let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(favorites) {
                    defaults.set(encoded, forKey: "SavePokemon")
            }
         }
       }
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = filterArray.getName(index: indexPath)
        detail = filterArray.getDetail(index: indexPath)
        pokeInfo = [[filterArray.getName(index: indexPath)],[filterArray.getNumber(index: indexPath)],filterArray.getTypes(index: indexPath),filterArray.getChain(index: indexPath)]
        performSegue(withIdentifier: "ToPokeInfo", sender: nil)
        //tableView.deselectRow(at: indexPath, animated: true)
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

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filterArray = TablePokemonModel()
        
        if searchText == ""{
            filterArray = dataArray
        }
        
        //regresa un arreglo de los nombres de todas las structuras
        let pokemon = dataArray.rowsArray.map{ $0.name }
        let numeros = dataArray.rowsArray.map{ $0.number}
        
        for word in pokemon{
            if word.uppercased().contains(searchText.uppercased()){
                var filtro = dataArray.rowsArray.filter{$0.name == word}
                //filterArray.rowsArray = filtro
                filterArray.addDataToArray2(pokemon: filtro[0])
            }
        }
        
        for num in numeros{
            if num.uppercased().contains(searchText.uppercased()){
                var filtro = dataArray.rowsArray.filter{$0.number == num}
                //filterArray.rowsArray = filtro
                filterArray.addDataToArray2(pokemon: filtro[0])
            }
        }
        
        
        tableView.reloadData()
        
    }
    
}
