//
//  ViewController.swift
//  GetAPICalling
//
//  Created by Vrushabh Dhameliya on 04/06/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getapiCalling()
    }
    
    
    func getapiCalling() {
        AF.request("https://jsonplaceholder.typicode.com/comments", method: .get).responseJSON { data in
            
            switch data.result {
                
            case .success(let success):
                if let ansget = success as? NSArray {
                    for i in ansget {
                        if let dic = i as? NSDictionary {
                            self.arrData.append(UserData(dic: dic))
                        }
                        self.tableView.reloadData()
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

// MARK: - TableView Dalegate & Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.postIdLbl.text = "\(arrData[indexPath.row].postId)"
        cell.idLbl.text = "\(arrData[indexPath.row].id)"
        cell.nameLbl.text = arrData[indexPath.row].name
        cell.emailLbl.text = arrData[indexPath.row].email
        cell.bodyLbl.text = arrData[indexPath.row].body
        
        return cell
    }
}
