//
//  CharacterListTableViewCell.swift
//  Magus
//
//  Created by Student on 2018. 06. 20..
//  Copyright © 2018. BRM. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var CharacterNames: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
