//
//  MainTableViewCell.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet var cellBackView: UIView!
    @IBOutlet var imageFlagCell: UIImageView!
    @IBOutlet var countryLabelCell: UILabel!
    @IBOutlet var capitalLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
