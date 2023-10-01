//
//  ViewController.swift
//  First
//
//  Created by Diplomado on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func lightButtonTapped(_ sender: UIButton) {
    
        guard let status = sender.titleLabel!.text else {
            return
        }
    
            if status == "Turn On"{
                
                sender.setTitle("Turn Off", for: .normal)
                view.backgroundColor = .white
                
            }else {
                
                sender.setTitle("Turn On", for: .normal)
                view.backgroundColor = .black
                
            }
        }
        
    
}

