//
//  NewsTableViewCell.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 15.09.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: NewsImageView! {
        didSet {
            newsImageView.contentMode = .scaleAspectFit
            newsImageView.clipsToBounds = true
        }
        
    }
    @IBOutlet weak var titleNewsLabel: UILabel!
    @IBOutlet weak var subtitleNewsLabel: UILabel!
    
    
    func configure(with news: News?) {
        titleNewsLabel.text = news?.headerNews
        subtitleNewsLabel.text = news?.textNews
        newsImageView.getImage(url: news?.image ?? "")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
