//
//  SecondApiTableViewCell.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 05/06/24.
//

import UIKit

class SecondApiTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeNameLbl: UILabel!
    @IBOutlet weak var employeeSalaryLbl: UILabel!
    @IBOutlet weak var employeeAgeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
