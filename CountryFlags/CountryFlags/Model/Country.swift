//
//  Country.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import Foundation

struct Country: Codable {
    var name :  String?
    var capital : String?
    var countryCode : String?
    var flag : String?
    var alpha3Code : String?
    var region : String?
    var population : Int?
    var currencies : [Currencies]?
}

struct Currencies: Codable {
    var code : String?
    var name : String?
    var symbol : String?
}
