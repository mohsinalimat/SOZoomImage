//
//  ViewController.swift
//  SOZoomImage
//
//  Created by ahmad alsofi on 7/29/18.
//  Copyright © 2018 AhmadAlsofi. All rights reserved.
//

let REUSABLE_ID_CELL = "ZoomCell"

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  , UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let arrayOfimage : [UIImage] = [#imageLiteral(resourceName: "apple"),#imageLiteral(resourceName: "lemon"),#imageLiteral(resourceName: "straw"),#imageLiteral(resourceName: "tomatm")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSABLE_ID_CELL, for: indexPath)
        let imageView =  cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfimage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ZoomID", sender: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageCollectionView.frame
        return CGSize(width: size.width, height: size.height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ZoomID" {
            let view = segue.destination as! ZoomVC
            let index = (sender as? Int) ?? 0
            view.image = arrayOfimage[index]
        }
    }
}

