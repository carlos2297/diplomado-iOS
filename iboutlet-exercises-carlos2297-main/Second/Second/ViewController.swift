//
//  ViewController.swift
//  Second
//
//  Created by Diplomado on 30/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
}
    
    
    @IBAction func rSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        rLabel.text = String(round(rSlider.value))
        if view.backgroundColor == .black{
            rLabel.textColor = .white
        }
    }
    
    
    @IBAction func gSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        gLabel.text = String(round(gSlider.value))
        if view.backgroundColor == .black{
            gLabel.textColor = .white
        }
    }
    
    @IBAction func bSliderMoving(_ sender: UISlider) {
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        bLabel.text = String(round(bSlider.value))
        if view.backgroundColor == .black{
            bLabel.textColor = .white
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        rSlider.value = 255
        gSlider.value = 255
        bSlider.value = 255
        
        view.backgroundColor = UIColor.init(red: CGFloat((rSlider.value)/255), green: CGFloat((gSlider.value)/255), blue: CGFloat((bSlider.value)/255), alpha: 1)
        rLabel.text = String(round(rSlider.value))
        gLabel.text = String(round(gSlider.value))
        bLabel.text = String(round(bSlider.value))
        
    }
    
    
}

