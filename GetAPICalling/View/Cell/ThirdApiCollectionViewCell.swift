//
//  ThirdApiCollectionViewCell.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 05/06/24.
//

import UIKit

class ThirdApiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var salaryLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           updateBackgroundColor()
       }
       
       func updateBackgroundColor() {
           self.contentView.backgroundColor = randomColor()
       }
       
       private func randomColor() -> UIColor {
           let red = CGFloat.random(in: 0.0...1.0)
           let green = CGFloat.random(in: 0.0...1.0)
           let blue = CGFloat.random(in: 0.0...1.0)
           return UIColor(red: red, green: green, blue: blue, alpha: 0.8)
       }
}
