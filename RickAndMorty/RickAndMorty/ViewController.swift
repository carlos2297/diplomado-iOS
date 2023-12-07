//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Diplomado on 01/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentPage = 1
    var totalPages = 0
    
    
    let restClient = RESTClient<PaginatedResponse<Character>>(client: Client("https://rickandmortyapi.com"))
    
   
    var characters: [Character]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentPageLabel: UILabel!
    
    @IBOutlet weak var totalPagesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        restClient.show("/api/character/", page: currentPage) { response in
                self.characters = response.results
                self.totalPagesLabel.text = String(response.info.pages)
                self.totalPages = response.info.pages
        }
        currentPageLabel.text = String(currentPage)
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
        cell?.imageView?.image = UIImage(systemName: "person.fill")
    
        
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

extension ViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let characters = characters else { return }
        let needsFetch = indexPaths.contains { $0.row >= characters.count - 1 }
        
        if needsFetch {
            restClient.show("/api/character/", page: currentPage + 1) { response in
                self.characters?.append(contentsOf: response.results)
            }
            if currentPage < totalPages {
                currentPage += 1
                currentPageLabel.text = String(currentPage)
            }
        }
    }
}

