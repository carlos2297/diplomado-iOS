//
//  CollectionViewController.swift
//  collectionTableView
//
//  Created by Eric Rojas Pech on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var name = ""
    var typeInfo = [[String]]()
    

    @IBOutlet weak var textFiled: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            collectionView.register(UINib(nibName: "Custom", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    let size = UIScreen.main.bounds.width / 2
    
    var dataArray = TableTypesModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        collectionView.delegate = self

    }
    

    
}

extension CollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.getCountArray()
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Custom
        
        cell?.myTextLabel.text = dataArray.getName(index: indexPath)
        cell?.imageType.image = UIImage(named: dataArray.getName(index: indexPath))
        
        return cell!
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        name = dataArray.getName(index: indexPath)
        typeInfo = [dataArray.getDealt(index: indexPath),dataArray.getDrecive(index: indexPath),dataArray.getHdealt(index: indexPath),dataArray.getHrecive(index: indexPath),dataArray.getNotby(index: indexPath),dataArray.getNoagain(index: indexPath)]
        performSegue(withIdentifier: "ToTypeInfo", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToTypeInfo" {
                if let destinationVC = segue.destination as? TypeInfoController {
                   destinationVC.name = name
                   destinationVC.dataArray = typeInfo
                }
            }
        }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: size, height: size)
    }
    

    
}
