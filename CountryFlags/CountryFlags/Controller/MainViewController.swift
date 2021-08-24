//
//  ViewController.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit
import SDWebImageSVGCoder

class MainViewController: UIViewController {
    
    @IBOutlet var searchCountry: UISearchBar!
    @IBOutlet var searchTableView: UITableView!
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    var service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        getData()
    }
    
    func getData() {
        service.fetchCountry(endPoint: "all") { [self] (result) in
            if result != nil {
                countries.append(contentsOf: result!)
                filteredCountries.append(contentsOf: result!)
                searchTableView.reloadData()
            }
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        let filteredCountry = filteredCountries[indexPath.row]
        cell.countryLabelCell.text = filteredCountry.name
        cell.capitalLabelCell.text = filteredCountry.capital
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageFlagCell.sd_setImage(with: URL(string: (filteredCountry.flag)!))
        return cell
    }
}

extension MainViewController: UISearchBarDelegate,UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountries = countries.filter({$0.name!.contains(searchText)})
        if searchText == "" {
            filteredCountries = countries
        }
        searchTableView.reloadData()
    }
}

