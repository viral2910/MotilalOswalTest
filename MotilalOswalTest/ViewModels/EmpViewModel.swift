//
//  EmpViewModel.swift
//  MotilalOswalTest
//
//  Created by Viral Vinchhi on 18/11/20.
//  Copyright © 2020 Viral Vinchhi. All rights reserved.
//

import Foundation

class EmpViewModel : NSObject {
    
    //instance of APICALL Class
    private var apiService : APICall!
    
    //setting details from model to controller
    private(set) var empData : AllEmployees! {
        didSet {
            self.ModelToController()
        }
    }
    
    //instance of model
    var ModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        //assign apicall to instance
        self.apiService =  APICall()
        callFuncToGetEmpData()
    }
    
    //getting data from the API
    func callFuncToGetEmpData() {
        self.apiService.GetEmployeeDetails { (empData) in
            self.empData = empData
        }
    }
}
