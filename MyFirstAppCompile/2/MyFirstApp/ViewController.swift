//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Eric Rojas Pech on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var photoTypeSwitch: UISwitch!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var textFieldSwitch: UISwitch!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var titleTextField: UITextField!{
        didSet{
            titleTextField.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? ImageStackViewControllerF else {return}
        
        destinationViewController.showCat = photoTypeSwitch.isOn
        
        if textFieldSwitch.isOn {
            destinationViewController.title = titleTextField.text
        }
    }
    
    @IBAction func photoTypeSwitchValueChnged(_ sender: UISwitch) {
        
        sender.isOn ? nextButton.setTitle("Cats", for: .normal) : nextButton.setTitle("Dogs", for: .normal)
    }
    
    
    @IBAction func textFieldSwitchValueChanged(_ sender: UISwitch) {
        
        if sender.isOn{
            titleLabel.text = titleTextField.text
        }else {
            titleLabel.text = "Custom title no selected"
        }
        
    }
    
    @IBAction func titleTextFieldEditingChnged(_ sender: UITextField) {
        titleLabel.text = sender.text
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton){
        
        print(photoTypeSwitch.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("4")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("5")
    }
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {return true}
        if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " "{
            return false
        }else{
            return (textField.text?.count ?? 0) + string.count  - range.length <= 10
        }
    }
}
