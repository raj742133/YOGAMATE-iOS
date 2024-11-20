//
//  SearchPoseViewController.swift
//  test-yoga5
//
//  Created by user3 on 18/11/24.
//

import UIKit

class SearchPoseViewController: UIViewController {
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imgLabel: UIImageView!
    
    
    var poses: Poses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure image view for better display
        imgLabel.contentMode = .scaleAspectFit
        
        // Allow description label to show multiple lines
        descLabel.numberOfLines = 0
        
        // Set the data
        if let poses = poses {
            title = poses.name  // Add this to show the pose name in navigation bar
            nameLabel.text = poses.name
            imgLabel.image = UIImage(named: poses.imageName)
            descLabel.text = poses.description
        }
    }
}
