//
//  ProfileTableViewCell.swift
//  test-yoga5
//
//  Created by user@30 on 18/11/24.
//


//
//  ProfileTableViewCell.swift
//  FinalProfile
//
//  Created by user@30 on 12/11/24.
//

import UIKit


class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
