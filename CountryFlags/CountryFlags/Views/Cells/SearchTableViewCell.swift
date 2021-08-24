//
//  MainTableViewCell.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SearchTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet var cellBackView: UIView!
    @IBOutlet var imageFlagCell: UIImageView!
    @IBOutlet var countryLabelCell: UILabel!
    @IBOutlet var capitalLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackView.layer.shadowColor = UIColor.gray.cgColor
        cellBackView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cellBackView.layer.shadowOpacity = 1.0
        cellBackView.layer.masksToBounds = false
        cellBackView.layer.cornerRadius = 15.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
