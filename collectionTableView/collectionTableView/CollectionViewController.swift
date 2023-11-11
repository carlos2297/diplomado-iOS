//
//  CollectionViewController.swift
//  collectionTableView
//
//  Created by Eric Rojas Pech on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            collectionView.register(UINib(nibName: "Custom", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    let size = UIScreen.main.bounds.width / 2
    
    var dataArray = ["MAC","MINI", "IPHONE", "HomePod" ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
         
//drag and drop
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlerLongPressGesture))
        
        collectionView.addGestureRecognizer(longPressGesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func handlerLongPressGesture(_ gesture: UILongPressGestureRecognizer){
        let gestureLocation = gesture.location(in: collectionView)
        switch gesture.state{
        case .began:
            guard let targeIndexPath = collectionView.indexPathForItem(at: gestureLocation) else {return}
            collectionView.beginInteractiveMovementForItem(at: targeIndexPath)
            
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
            
        case .ended:
            collectionView.endInteractiveMovement()
            
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    ///
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dataArray.append(textFiled.text ?? "")
        textFiled.text = ""
        //recarga la collecion o tabla para que muestre el agregado
        collectionView.reloadData()
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

extension CollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Custom
        
        cell?.myTextLabel.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            CGSize(width: size, height: size)
        } else {
            CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(item, at: destinationIndexPath.row)
        
        collectionView.reloadData()
    }
    
    
    
}
