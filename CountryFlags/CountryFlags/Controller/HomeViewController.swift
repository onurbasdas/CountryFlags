//
//  HomeViewController.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit
import SDWebImageSVGCoder

class HomeViewController: UIViewController {
    @IBOutlet var homeCollectionView: UICollectionView!
    
    var homes = [Country]()
    var service = Service()
    
    override func viewDidLoad() {
        
        homeCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        service.fetchCountry(endPoint: "all") { [self] (result) in
            if result != nil {
                homes.append(contentsOf: result!)
                homeCollectionView.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag)!))
        cell.labelHome.text = homeArray.name

        return cell
    }
    
    
}
