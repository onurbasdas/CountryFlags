//
//  DetailViewController.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit
import SDWebImageSVGCoder

class DetailViewController: UIViewController {

    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var countryDetail: UILabel!
    @IBOutlet var regionDetail: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
    }
    
    func configureUI() {
        imageDetail.layer.shadowColor = UIColor.gray.cgColor
        imageDetail.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageDetail.layer.shadowOpacity = 1.0
        imageDetail.layer.masksToBounds = false
    }
    
    func getData() {
        navigationItem.title = country?.alpha3Code
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        imageDetail.sd_setImage(with: URL(string: (country?.flag)!))
        regionDetail.text = country?.region
        countryDetail.text = country?.name
        populationLabel.text = "Population: \(country?.population! ?? 5)"
        currencyLabel.text = "\(country?.currencies![0].code ?? "") : \(country?.currencies![0].name ?? "")"
    }
}
