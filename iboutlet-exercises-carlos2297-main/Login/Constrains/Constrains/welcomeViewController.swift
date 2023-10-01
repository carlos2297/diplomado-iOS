//
//  welcomeViewController.swift
//  Constrains
//
//  Created by Diplomado on 30/09/23.
//

import UIKit

class welcomeViewController: UIViewController {

    var Name = "Desconocido"
    
    
    @IBOutlet weak var userName: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userName.text = Name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
