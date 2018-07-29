//
//  ZoomVC.swift
//  SOZoomImage
//
//  Created by ahmad alsofi on 7/29/18.
//  Copyright © 2018 AhmadAlsofi. All rights reserved.
//

import UIKit

class ZoomVC: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageForZoom: UIImageView!
    
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageForZoom.image = image
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.zoomScale = 1.5
    }
  
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageForZoom
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
