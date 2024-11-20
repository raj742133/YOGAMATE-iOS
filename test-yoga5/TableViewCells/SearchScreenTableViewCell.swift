//
//  SearchScreenTableViewCell.swift
//  test-yoga5
//
//  Created by user3 on 16/11/24.
//

import UIKit

class SearchScreenTableViewCell: UITableViewCell {

    
    @IBOutlet weak var poseImage: UIImageView!
    
    
    @IBOutlet weak var poseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
