//
//  DetailsPlayerViewController.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 23.08.2022.
//

import UIKit

class DetailsPlayerViewController: UIViewController {
    
    @IBOutlet weak var picturePlayerImageView: UIImageView!
    @IBOutlet weak var aboutPlayerLabel: UILabel!
    

    
    var player: Player!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutPlayerLabel.text = player.youtube
  
        
        
    }
}
