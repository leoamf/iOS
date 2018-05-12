//
//  ViewController.swift
//  CollectionView
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
 
    
    @IBOutlet var collectionView: UICollectionView!
    
     var emoticons = ["😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱","😱"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emoticons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath)
        
        if let myCell = cell as? MyCollecionViewCell{
            myCell.myLabel.text = emoticons[indexPath.row]
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

