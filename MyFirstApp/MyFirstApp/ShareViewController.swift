//
//  ShareViewController.swift
//  MyFirstApp
//
//  Created by Carlos Alberto Rangel Garcia on 29/09/23.
//

import UIKit

class ShareViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!{
        didSet{
            textView.delegate = self
        }
    }

    @IBAction func shareButtonPush(_ sender: UIButton) {
        guard let text = textView.text else{
            return
        }
        print(text)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension ShareViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return (textView.text?.count ?? 0) + text.count  - range.length <= 150
    }
}

