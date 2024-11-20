//
//  CollectionViewCell.swift
//  test-yoga5
//
//  Created by user@22 on 18/11/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var yogaimg: UIImageView!
    
    @IBOutlet weak var yogatitle: UILabel!
    
    @IBOutlet weak var yogasubtitle: UILabel!
    
    
   override func layoutSubviews() {
           super.layoutSubviews()
           
           // Round top-left and top-right corners of the image
           roundCorners(view: yogaimg, corners: [.topLeft, .topRight], radius: 15)
           
           // Round bottom-left and bottom-right corners of the title
           roundCorners(view: yogatitle, corners: [.bottomLeft, .bottomRight], radius: 10)
       }
       
       func roundCorners(view: UIView, corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: view.bounds,
                                   byRoundingCorners: corners,
                                   cornerRadii: CGSize(width: radius, height: radius))
           let mask = CAShapeLayer()
           mask.path = path.cgPath
           view.layer.mask = mask
       }
    
}
