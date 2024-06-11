//
//  ShowDataViewController.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 05/06/24.
//

import UIKit

class ShowDataViewController: UIViewController {
    
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    var name = ""
    var salary = ""
    var age = ""
    
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameLbl.text = name
        self.salaryLbl.text = salary
        self.ageLbl.text = age
        view.backgroundColor = backgroundColor
    }
    

   

}
