//
//  HomeCollectionViewCell.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HomeCollectionViewCell", bundle: nil)
    }
    @IBOutlet var homeBackView: UIView!
    @IBOutlet var imageHome: UIImageView!
    @IBOutlet var labelHome: UILabel!
    @IBOutlet var homeBlur: UIVisualEffectView!
    @IBOutlet var blurView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeBackView.layer.shadowColor = UIColor.gray.cgColor
        homeBackView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        homeBackView.layer.shadowOpacity = 1.0
        homeBackView.layer.masksToBounds = false
        homeBackView.layer.cornerRadius = 15.0
    }

}
