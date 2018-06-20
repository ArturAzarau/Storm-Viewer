//
//  ViewPhotoVC.swift
//  Storm Viewer
//
//  Created by Артур Азаров on 21.06.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class ViewPhotoVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - Properties
    
    var pictureToShow = UIImage()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = pictureToShow
    }
    
    // MARK: -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // MARK: -
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: - Fro iPhone X
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController!.hidesBarsOnTap
    }
}
