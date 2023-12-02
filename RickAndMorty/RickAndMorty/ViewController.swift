//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Diplomado on 01/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentPage = 1
    
    let restClient = RESTClient<PaginatedResponse<Character>>(client: Client("https://rickandmortyapi.com"))
   
    
    var characters: [Character]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextPageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
    }
    
    func loadData() {
        restClient.show("/api/character/",page:currentPage) { response in
        self.characters = response.results
        }
    }
    
    
    @IBAction func nextPageButtonTapped(_ sender: UIButton) {
        currentPage += 1
        loadData()
    }
    
}




extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.textLabel?.text = characters?[indexPath.row].name
        cell?.detailTextLabel?.text = characters?[indexPath.row].species
    
        
        return cell!
        }
        
        
    func numberOfSections(in tableView: UITableView) -> Int {
         1
        }
        
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150.0
    }
    
    
}
