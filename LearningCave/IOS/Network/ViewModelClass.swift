//
//  ViewModelClass.swift
//  Tumble
//
//  Created by Shilpa M on 02/05/21.
//

import UIKit

class ViewModelClass: NSObject {

    //var delegate : GTBooksSeriesViewModelDelegate?
    private var apiService : APIService?
    let group = DispatchGroup()
    let sourcesURL = URL(string: "https://anapioficeandfire.com/api/books/")

    private(set) var empData : [ModelClass]! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
       self.group.enter()
        self.apiService?.apiToGetBooksData(sourcesURL: sourcesURL!) { (empData) in
            self.empData = empData
            //self.delegate?.dataFound(data: self.empData)
            
       }
        self.group.leave()
    }

}
