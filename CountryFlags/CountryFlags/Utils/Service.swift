//
//  Service.swift
//  CountryFlags
//
//  Created by Onur Başdaş on 24.08.2021.
//

import Foundation
import Alamofire

class Service {
    static func fetchCountry(endPoint:String,callback:@escaping ([Country]?) -> Void){
        AF.request(Constants.baseUrl + endPoint, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let countryResponse = try JSONDecoder().decode([Country].self, from:data)
                callback(countryResponse)
            }catch let e {
                print(e)
            }
        }
    }
    
    static func getCountryRegion(endPoint:String,callback:@escaping ([Country]?) -> Void){
        AF.request(Constants.regionUrl + endPoint, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let countryResponse = try JSONDecoder().decode([Country].self, from:data)
                callback(countryResponse)
            }catch let e {
                print(e)
            }
        }
    }
}
