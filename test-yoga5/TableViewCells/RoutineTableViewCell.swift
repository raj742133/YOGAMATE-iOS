//
//  RoutineTableViewCell.swift
//  test-yoga5
//
//  Created by user@22 on 18/11/24.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var poseImg: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
