//
//  ViewController.swift
//  Tablas
//
//  Created by Eric Rojas Pech on 27/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let model = TableViewModel()

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        model.addRow(text: textField.text ?? "No text")
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: model.getCountArray()
        case 1: model.getCountArray() // 1
        default: model.getCountArray() // 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
//        if cell == nil{
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        
        
//        cell?.textLabel?.text = model.getTitle(index: indexPath)
//        cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
        switch indexPath.section {
        case 0: cell?.backgroundColor = .blue
        case 1: cell?.backgroundColor = .brown
        default: cell?.backgroundColor = .orange
        }
        
        cell?.myTitle.text = model.getTitle(index: indexPath)
        cell?.mySubtitle.text = model.getDescription(index: indexPath)
          return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Llegue aquí")
            model.deleteRow(number: indexPath)
            tableView.reloadData()
            print(model.getCountArray())
            
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1: 80
        case 2: 100
        default: 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model.getTitle(index: indexPath))
        performSegue(withIdentifier: "TableToNextView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
