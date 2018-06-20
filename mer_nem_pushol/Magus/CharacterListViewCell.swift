//
//  CharacterListViewCell.swift
//  Magus
//
//  Created by Student on 2018. 06. 07..
//  Copyright © 2018. BRM. All rights reserved.
//

import UIKit

class CharacterListViewCell: UITableViewCell {

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
