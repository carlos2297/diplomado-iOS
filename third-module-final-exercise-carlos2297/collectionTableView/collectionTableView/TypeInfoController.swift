//
//  TypeInfoController.swift
//  collectionTableView
//
//  Created by Diplomado on 11/11/23.
//

import UIKit

class TypeInfoController: UIViewController {
    
    
    var dataArray = [[String]]()
    var name = ""
    var info = 0

    @IBOutlet weak var typeImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeImage.image = UIImage(named: name)
        tableView.dataSource = self
    }
    
}


extension TypeInfoController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Doble daño A"
        case 1:
            return "Doble daño De"
        case 2:
            return "Mitad de daño A"
        case 3:
            return "Mitad de daño De"
        case 4:
            return "No le afecta A"
        case 5:
            return "No le hacen daño"
        default:
            return "None"
        }
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
