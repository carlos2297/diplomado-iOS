//
//  imageStaticViewController.swift
//  MyFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class imageStaticViewController: UIViewController {
    
    var showDog = false

    @IBOutlet weak var firstCaptionImage: CaptionImage!
    @IBOutlet weak var secondCaptionImage: CaptionImage!
    @IBOutlet weak var thirdCaptionImage: CaptionImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showDog {
            
            firstCaptionImage.setContent(image: "shiba-1", caption: "shiba-1")
        
            secondCaptionImage.setContent(image: "shiba-2", caption: "shiba-2")
            
            thirdCaptionImage.setContent(image: "shiba-3", caption: "shiba-3")
            
        } else {
            
            firstCaptionImage.setContent(image: "images-2", caption: "images-2")
        
            secondCaptionImage.setContent(image: "images-3", caption: "images-3")
            
            thirdCaptionImage.setContent(image: "images-4", caption: "images-4")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segueToShare(_ sender: UIBarButtonItem) {
        let shareViewController = shareController()
        present(shareViewController, animated: true)
    }

}
