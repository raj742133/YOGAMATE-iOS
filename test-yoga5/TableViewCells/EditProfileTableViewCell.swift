//
//  EditProfileTableViewCell.swift
//  test-yoga5
//
//  Created by user@30 on 18/11/24.
//


//
//  EditProfileTableViewCell.swift
//  test-yoga5
//
//  Created by user@30 on 14/11/24.
//

import UIKit

class EditProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    weak var delegate: EditProfileTableViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
                contentView.backgroundColor = .white
                
                // Create a circular UIView as container for the image
                let containerView = UIView()
                containerView.translatesAutoresizingMaskIntoConstraints = false
                containerView.backgroundColor = .clear
                contentView.addSubview(containerView)
                
                // Remove profileImage from its current superview and add to container
                profileImage.removeFromSuperview()
                containerView.addSubview(profileImage)
                
                // Configure profile image
                profileImage.contentMode = .scaleAspectFill
                profileImage.clipsToBounds = true
                profileImage.layer.masksToBounds = true
                profileImage.translatesAutoresizingMaskIntoConstraints = false
                
                // Configure upload button
                uploadButton.setTitle("Upload Photo", for: .normal)
                uploadButton.setTitleColor(.systemBlue, for: .normal)
                uploadButton.titleLabel?.font = .systemFont(ofSize: 17)
                uploadButton.contentHorizontalAlignment = .center
                uploadButton.translatesAutoresizingMaskIntoConstraints = false
                
                // Setup constraints
                NSLayoutConstraint.activate([
                    // Container constraints
                    containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                    containerView.widthAnchor.constraint(equalToConstant: 100),
                    containerView.heightAnchor.constraint(equalToConstant: 100),
                    
                    // Profile image constraints (fill container)
                    profileImage.topAnchor.constraint(equalTo: containerView.topAnchor),
                    profileImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    profileImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    profileImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    
                    // Upload button constraints
                    uploadButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    uploadButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12),
                    uploadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    uploadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    uploadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
                ])
                
                uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
            }
            
            override func layoutSubviews() {
                super.layoutSubviews()
                // Make container and image circular
                profileImage.layer.cornerRadius = 50 // Half of width/height
                profileImage.layer.masksToBounds = true
            }
            
    @objc private func uploadButtonTapped() {
                delegate?.handleImageSelection()
            }
}
