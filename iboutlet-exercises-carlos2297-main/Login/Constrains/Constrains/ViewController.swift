//
//  ViewController.swift
//  Constrains
//
//  Created by Manuel Sánchez on 22/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    
    @IBOutlet weak var contraseñaTextField: UITextField!

    @IBOutlet weak var accederButton: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationViewController = segue.destination as? welcomeViewController else {return}
        
        destinationViewController.Name = usuarioTextField.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        accederButton.isEnabled = false
        
    }
    
    @IBAction func usuarioTyped(_ sender: UITextField) {
        
        if usuarioTextField.text == "" || contraseñaTextField.text == "" {
            
            accederButton.isEnabled = false
        }else {
            accederButton.isEnabled = true
        }
        
    }
    
    
    @IBAction func contraseñaTyped(_ sender: UITextField) {
        if usuarioTextField.text == "" || contraseñaTextField.text == "" {
            
            accederButton.isEnabled = false
        }else {
            accederButton.isEnabled = true
        }
    }
    
    @IBAction func accederButtonTapped(_ sender: UIButton) {
        
        if usuarioTextField.text == "carlos" || contraseñaTextField.text == "12345" {
            
        }else {
            let alert = UIAlertController(title: "Error", message: "Usuario o contraseña erronea", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert,animated: true)
        }
    }
    
    
    @IBAction func showpasswordTapped(_ sender: UIButton) {
        
        if contraseñaTextField.isSecureTextEntry {
            
            contraseñaTextField.isSecureTextEntry = false
            sender.setTitle("Hidden password", for: .normal)
    
        } else {
            contraseñaTextField.isSecureTextEntry = true
            sender.setTitle("Show password", for: .normal)
        
        }
    
        
    }
    
}

