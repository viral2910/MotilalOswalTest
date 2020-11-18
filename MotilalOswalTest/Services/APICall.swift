//
//  APIService.swift
//  MotilalOswalTest
//
//  Created by Viral Vinchhi on 18/11/20.
//  Copyright © 2020 Viral Vinchhi. All rights reserved.
//

import Foundation

class APICall :  NSObject {
    
    //API URL
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    //getting employee details
    func GetEmployeeDetails(completion : @escaping (AllEmployees) -> ())
    {
        //Get api call
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                //serializing With decode and structure
                let empData = try! jsonDecoder.decode(AllEmployees.self, from: data)
                completion(empData)
            }
        }.resume()
    }
}
