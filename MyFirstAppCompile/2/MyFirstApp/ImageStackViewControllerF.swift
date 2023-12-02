//
//  ImageStackViewControllerF.swift
//  MyFirstApp
//
//  Created by Eric Rojas Pech on 29/09/23.
//

import UIKit

class ImageStackViewControllerF: UIViewController {
    
    var showCat = false
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var thirdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  showCat{
            
            firstImageView.image = UIImage(named: "images-2")
            secondImageView.image = UIImage(named: "images-3")
            thirdImageView.image = UIImage(named: "images-4")
            
        } else {
        
    
            firstImageView.image = UIImage(named: "dog-1")
            secondImageView.image = UIImage(named: "dog-2")
            thirdImageView.image = UIImage(named: "feid")
            
        }
        

        // Do any additional setup after loading the view.
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
