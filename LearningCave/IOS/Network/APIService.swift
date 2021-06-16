//
//  TableViewCell.swift
//  Tumble
//
//  Created by Shilpa M on 02/05/21.
//

import Foundation

class APIService :  NSObject {

    func apiToGetBooksData(sourcesURL : URL , completion : @escaping ([ModelClass]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if data != nil && error == nil {
                do {
                    let decoder = JSONDecoder()
                     //Decode JSON Response Data
                    let model = try decoder.decode([ModelClass].self, from:
                        data!)
                    completion(model)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
        }.resume()
    }
    
    
    func apiToGetCharactersData(sourcesURL : URL , completion : @escaping (ModelClass) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                do {
                    //Here dataResponse received from a network request
                    let decoder = JSONDecoder()
                    //Decode JSON Response Data
                    let model = try decoder.decode(ModelClass.self, from:
                                 data)
                    completion(model)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
        }.resume()
    }
}
