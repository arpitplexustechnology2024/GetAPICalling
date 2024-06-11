//
//  SecondApiViewController.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 05/06/24.
//

import UIKit
import Alamofire

class SecondApiViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employees = [Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        fetchEmployees()
    }
    
    func fetchEmployees() {
        let url = "https://dummy.restapiexample.com/api/v1/employees"
               print("Fetching employees from URL: \(url)")
               
               AF.request(url).responseDecodable(of: Welcome.self) { response in
                   switch response.result {
                   case .success(let welcome):
                       print("Successfully fetched employees data")
                       self.employees = welcome.data
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
                       print("Employees data: \(welcome.data)")
                   case .failure(let error):
                       print("Failed to fetch employees: \(error)")
                       if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                           print("Response data: \(jsonString)")
                       }
                   }
               }
           }
}
// MARK: - TableView Dalegate & Datasource
extension SecondApiViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondApiTableViewCell") as! SecondApiTableViewCell
        
        cell.employeeNameLbl.text = employees[indexPath.row].employeeName
        cell.employeeSalaryLbl.text = "\(employees[indexPath.row].employeeSalary)"
        cell.employeeAgeLbl.text = "\(employees[indexPath.row].employeeAge)"
        
        
        return cell
    }
}
