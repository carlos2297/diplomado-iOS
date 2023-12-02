//
//  CaptionImage.swift
//  MyFirstApp
//
//  Created by Diplomado on 13/10/23.
//

import UIKit

class CaptionImage: UIView {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setContent(image: String, caption :String?){
        captionLabel.text = caption
        captionLabel.isHidden = caption == nil
        imageView.image = UIImage(named: image)
        
    }
    
    private func setUpView() {
        
        //guard let contentView =  Bundle.main.loadNibNamed("CaptionImage", owner: self)?.first as? UIView else {return}
        
        
        guard let contentView = UINib(nibName: "CaptionImage", bundle: nil).instantiate(withOwner: self).first as? UIView else {return}
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        
        rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
    }
    

    

}
