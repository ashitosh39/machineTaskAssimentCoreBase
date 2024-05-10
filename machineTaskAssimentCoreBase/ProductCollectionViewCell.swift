//
//  ProductCollectionViewCell.swift
//  machineTaskAssimentCoreBase
//
//  Created by Macintosh on 16/01/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmailId: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userWebsite: UILabel!
    @IBOutlet weak var userCompany: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
