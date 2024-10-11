//
//  EgitimlerHucre.swift
//  BTKApp
//
//  Created by semih bekdaş on 3.10.2024.
//

import UIKit

class EgitimlerHucre: UITableViewCell {

    
    @IBOutlet weak var dersImage: UIImageView!
    
    @IBOutlet weak var dersLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var icon1: UIImageView!
    
    @IBOutlet weak var icon2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon1.tintColor = UIColor.gray
        icon1.image = icon1.image?.withRenderingMode(.alwaysTemplate)
        icon2.tintColor = UIColor.gray
        icon2.image = icon2.image?.withRenderingMode(.alwaysTemplate)

        
    }
    
    
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
