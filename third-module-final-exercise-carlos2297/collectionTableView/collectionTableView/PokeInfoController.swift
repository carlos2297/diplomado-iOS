//
//  PokeInfoController.swift
//  collectionTableView
//
//  Created by Diplomado on 11/11/23.
//

import UIKit

class PokeInfoController: UIViewController {
    
    var name = ""
    var detail = ""
    var dataArray = [[String]]()
    
    @IBOutlet weak var imagePokemon: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePokemon.image = UIImage(named: name)
        tableView.delegate = self
        tableView.dataSource = self
        detailLabel.text = detail
        
        // Do any additional setup after loading the view.
    }
    
}

extension PokeInfoController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Nombre"
        case 1:
            return "Numero"
        case 2:
            return "Tipos"
        case 3:
            return "Cadena Evolutiva"
        default:
            return "None"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
            
        }
        cell?.textLabel?.text = dataArray[indexPath.section][indexPath.row]
//
//        cell?.detailTextLabel?.text = filterArray.getNumber(index: indexPath)
//        print(filterArray.getNumber(index: indexPath))
//        cell?.detailTextLabel?.textColor = .systemBlue
//        
//        cell?.imageView?.image = UIImage(named: filterArray.getName(index: indexPath))
        return cell!
    }

}

extension PokeInfoController: UITableViewDelegate {
    
    
}

