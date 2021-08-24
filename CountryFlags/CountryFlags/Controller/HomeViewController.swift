//
//  HomeViewController.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit
import SDWebImageSVGCoder

class HomeViewController: UIViewController {
    
    @IBOutlet var continentsSegmentedControl: UISegmentedControl!
    @IBOutlet var user1View: UIView!
    @IBOutlet var user2View: UIView!
    @IBOutlet var user3View: UIView!
    @IBOutlet var user4View: UIView!
    @IBOutlet var user5View: UIView!
    @IBOutlet var user6View: UIView!
    
    var views = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAppend()
    }
    
    func viewAppend() {
        views.append(user1View)
        views.append(user2View)
        views.append(user3View)
        views.append(user4View)
        views.append(user5View)
        views.append(user6View)
        hideOtherViews(view: user1View)
    }
    
    func hideOtherViews(view:UIView) {
        for e in views {
            if e==view{
                e.isHidden = false
            }
            else {
                e.isHidden = true
            }
        }
    }
    
    @IBAction func userSwitch(_ sender: Any) {
        switch continentsSegmentedControl.selectedSegmentIndex {
        case 0:
            hideOtherViews(view: user1View)
            break;
        case 1:
            hideOtherViews(view: user2View)
            break;
        case 2:
            hideOtherViews(view: user3View)
            break;
        case 3:
            hideOtherViews(view: user4View)
            break;
        case 4:
            hideOtherViews(view: user5View)
            break;
        case 5:
            hideOtherViews(view: user6View)
            break;
        default:
            break;
        }
    }
}

class AllCountryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var allCollectionView: UICollectionView!
    
    var homes1 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.fetchCountry(endPoint: "all") { [self] result in
            homes1.append(contentsOf: result!)
            allCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes1[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag) ?? ""))
        
        cell.labelHome.text = homeArray.name
        return cell
    }
}

class AsiaHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var asiaCollectionView: UICollectionView!
    
    var homes2 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        asiaCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.getCountryRegion(endPoint: "asia") { [self] result in
            homes2.append(contentsOf: result!)
            asiaCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = asiaCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes2[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag)!))
        cell.labelHome.text = homeArray.name
        return cell
    }
}

class AfricaHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var africaCollectionView: UICollectionView!
    
    var homes3 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        africaCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.getCountryRegion(endPoint: "africa") { [self] result in
            homes3.append(contentsOf: result!)
            africaCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = africaCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes3[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag)!))
        cell.labelHome.text = homeArray.name
        return cell
    }
}

class EuropeHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var europeCollectionView: UICollectionView!
    
    var homes4 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        europeCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.getCountryRegion(endPoint: "europe") { [self] result in
            homes4.append(contentsOf: result!)
            europeCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes4.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = europeCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes4[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag) ?? ""))
        cell.labelHome.text = homeArray.name
        return cell
    }
}

class AmericasHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var americasCollectionView: UICollectionView!
    
    var homes5 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        americasCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.getCountryRegion(endPoint: "americas") { [self] result in
            homes5.append(contentsOf: result!)
            americasCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes5.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = americasCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes5[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag) ?? ""))
        cell.labelHome.text = homeArray.name
        return cell
    }
}

class AustraliaHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var australiaCollectionView: UICollectionView!
    
    var homes6 = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        australiaCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        Service.getCountryRegion(endPoint: "oceania") { [self] result in
            homes6.append(contentsOf: result!)
            australiaCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes6.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = australiaCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let homeArray = homes6[indexPath.row]
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageHome.sd_setImage(with: URL(string: (homeArray.flag) ?? ""))
        cell.labelHome.text = homeArray.name
        return cell
    }
}


