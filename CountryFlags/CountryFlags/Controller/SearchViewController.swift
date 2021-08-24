//
//  ViewController.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import UIKit
import SDWebImageSVGCoder

class SearchViewController: UIViewController {
    
    @IBOutlet var searchCountry: UISearchBar!
    @IBOutlet var searchTableView: UITableView!
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    var service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
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

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        let filteredCountry = filteredCountries[indexPath.row]
        cell.countryLabelCell.text = filteredCountry.name
        cell.capitalLabelCell.text = filteredCountry.capital
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        cell.imageFlagCell.sd_setImage(with: URL(string: (filteredCountry.flag)!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let detail = segue.destination as? DetailViewController {
                if let indexPath = searchTableView.indexPathForSelectedRow {
                    detail.country = filteredCountries[indexPath.row]
                    searchTableView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate,UISearchDisplayDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountries = countries.filter({$0.name!.contains(searchText)})
        if searchText == "" {
            filteredCountries = countries
        }
        searchTableView.reloadData()
    }
}

