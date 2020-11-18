//
//  EmpTableview.swift
//  MotilalOswalTest
//
//  Created by Viral Vinchhi on 18/11/20.
//  Copyright © 2020 Viral Vinchhi. All rights reserved.
//

import Foundation
import UIKit

class EmpTVDataSource<CELL : UITableViewCell,Value> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [Value]!
    var EmpCell : (CELL, Value) -> () = {_,_ in }
    
    //creating Cell
    init(cellIdentifier : String, items : [Value], configureCell : @escaping (CELL, Value) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.EmpCell = configureCell
    }
    
    //Assigning number of cell to tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    //configureCell for tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.EmpCell(cell, item)
        return cell
    }
}
