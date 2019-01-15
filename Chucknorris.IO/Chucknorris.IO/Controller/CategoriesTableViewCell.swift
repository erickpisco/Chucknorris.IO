//
//  CategoriesTableViewCell.swift
//  Chucknorris.IO
//
//  Created by erick pisco on 12/1/18.
//  Copyright © 2018 erick pisco. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {


    @IBOutlet weak var lbCategories: UILabel!
    
    @IBOutlet weak var ivCategory: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func prepareCell(with category: String) {
        
        lbCategories.text = category
        ivCategory.image = UIImage(named: "\(category)")
        ivCategory.layer.borderWidth = 3
        ivCategory.layer.borderColor = UIColor.black.cgColor
        ivCategory.layer.cornerRadius = ivCategory.frame.size.height/2
                
    }

}
