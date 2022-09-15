//
//  NewsImageView.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 15.09.2022.
//

import UIKit

class NewsImageView: UIImageView {

    
    func getImage(url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "ball")
            return
        }
        
        ImageManager.shared.getImage(imageUrl: url) { data, response in
            self.image = UIImage(data: data)
            
        }
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
