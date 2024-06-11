//
//  ThirdApiViewController.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 05/06/24.
//

import UIKit
import SwiftyJSON

class ThirdApiViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var employees = [Datum]()
    var selectedColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionview.delegate = self
        collectionview.dataSource = self
        
        fetchEmployees()
    }
    
    func fetchEmployees() {
            let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Failed to fetch employees:", error ?? "Unknown error")
                    return
                }
                
                do {
                    let json = try JSON(data: data)
                    let status = json["status"].stringValue
                    
                    guard status == "success" else {
                        print("Failed to fetch employees: Status is not success")
                        return
                    }
                    
                    let employeesJSON = json["data"].arrayValue
                    for employeeJSON in employeesJSON {
                        let id = employeeJSON["id"].intValue
                        let employeeName = employeeJSON["employee_name"].stringValue
                        let employeeSalary = employeeJSON["employee_salary"].intValue
                        let employeeAge = employeeJSON["employee_age"].intValue
                        let profileImage = employeeJSON["profile_image"].stringValue
                        
                        let employee = Datum(id: id, employeeName: employeeName, employeeSalary: employeeSalary, employeeAge: employeeAge, profileImage: profileImage)
                        self.employees.append(employee)
                    }
                    
                    DispatchQueue.main.async {
                        self.collectionview.reloadData()
                    }
                } catch let error {
                    print("Failed to parse JSON:", error)
                }
            }.resume()
        }
  

}

extension ThirdApiViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // CollectionView DataSource Methods
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return employees.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdApiCollectionViewCell", for: indexPath) as? ThirdApiCollectionViewCell else {
                print("Failed to dequeue EmployeeCollectionViewCell")
                return UICollectionViewCell()
            }
            
            let employee = employees[indexPath.item]
            cell.nameLbl.text = employee.employeeName
            cell.salaryLbl.text = "Salary: \(employee.employeeSalary)"
            cell.ageLbl.text = "Age: \(employee.employeeAge)"
            
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowDataViewController") as! ShowDataViewController
        
        let employee = employees[indexPath.row]
        vc.name = employees[indexPath.row].employeeName
        vc.salary = "Salary: \(employee.employeeSalary)"
        vc.age = "Age: \(employee.employeeAge)"
        
        let cell = collectionView.cellForItem(at: indexPath)
               selectedColor = cell?.contentView.backgroundColor
        vc.backgroundColor = selectedColor
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width = collectionView.frame.width / 3 - 1
            return CGSize(width: width, height: width)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }
    
    }
