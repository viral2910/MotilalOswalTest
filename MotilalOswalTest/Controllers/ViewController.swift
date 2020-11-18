//
//  ViewController.swift
//  MotilalOswalTest
//
//  Created by Viral Vinchhi on 18/11/20.
//  Copyright © 2020 Viral Vinchhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Reference From Storyboard
    @IBOutlet weak var TableView: UITableView!
    
    //Instance of Model
    private var ViewModel : EmpViewModel!
    
    //Instance of Tableview delegates
    private var dataSource : EmpTVSource<CustomTVC,Employee>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUpdate()
    }
    
    //UIUpdate with model
    func UIUpdate(){
        IJProgressView.shared.showProgressView()
        self.ViewModel = EmpViewModel()
        self.ViewModel.ModelToController = {
            self.updateDataSource()
        }
        IJProgressView.shared.hideProgressView()
    }
    
    //Update Tableview data with model details
    func updateDataSource(){
        self.dataSource = EmpTVSource(cellIdentifier: "CustomTVC", items: self.ViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = "Employee id : \(evm.id)"
            cell.employeeNameLabel.text = "Employee Name : \(evm.employeeName)"
        })
        DispatchQueue.main.async {
            self.TableView.dataSource = self.dataSource
            self.TableView.reloadData()
        }
    }
    
}
