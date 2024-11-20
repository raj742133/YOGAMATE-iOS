//
//  EditProfileTableViewController.swift
//  test-yoga5
//
//  Created by user@30 on 18/11/24.
//


//
//  EditProfileTableViewController.swift
//  test-yoga5
//
//  Created by user@30 on 14/11/24.
//

import UIKit

class EditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ProfilePickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup table view
           //tableView.backgroundColor = .systemGroupedBackground
           //tableView.separatorStyle = .singleLine
           //tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
           
           // Set section style
           //tableView.backgroundColor = .systemGroupedBackground
           //view.backgroundColor = .systemGroupedBackground
        
        
        // Set up navigation bar
            title = "Edit Profile"
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Add these lines
           tableView.backgroundColor = .systemGroupedBackground
           tableView.separatorStyle = .singleLine
           tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
      
        
    }
    
    //edit picker
    func didSelectValue(_ value: String, for field: String) {
            if let cell = tableView.cellForRow(at: IndexPath(row: field == "height" ? 1 : 2, section: 1)) {
                if let valueLabel = cell.contentView.subviews.last as? UILabel {
                    valueLabel.text = value
                }
            }
        }
    
    // Add the new image picker methods here
    func handleImageSelection() {
        let actionSheet = UIAlertController(title: "Change Profile Picture",
                                          message: nil,
                                          preferredStyle: .actionSheet)
        
        // Camera option
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.openCamera()
        }))
        
        // Photo Library option
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { [weak self] _ in
            self?.openGallery()
        }))
        
        // Cancel option
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        present(actionSheet, animated: true)
    }
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true)
        }
    }
    
    private func openGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            // Update the profile image in your cell
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? EditProfileTableViewCell {
                cell.profileImage.image = editedImage
            }
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        }else if section == 1{
            return 5
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! EditProfileTableViewCell
                cell.profileImage.image = UIImage(named: "profile pic")
                cell.delegate = self  // Add this line to set the delegate
                cell.backgroundColor = .white
                cell.contentView.backgroundColor = .white
                cell.selectionStyle = .none
            
            // Ensure immediate corner radius update
                cell.layoutIfNeeded()
                return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .white
            cell.contentView.backgroundColor = .white
            cell.selectionStyle = .none
            // Remove all existing subviews from content view
            cell.contentView.subviews.forEach { $0.removeFromSuperview() }
                
            let nameLabel = UILabel()
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            let valueLabel = UILabel()
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
                
            cell.contentView.addSubview(nameLabel)
            cell.contentView.addSubview(valueLabel)
                
                // Setup constraints
                NSLayoutConstraint.activate([
                    nameLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
                    nameLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                    
                    valueLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
                    valueLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
                ])
            switch indexPath.row {
                    case 0:
                // For the Name row
                            let nameLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 100, height: 44))
                            nameLabel.text = "Name"
                            nameLabel.font = .systemFont(ofSize: 17)
                            nameLabel.textColor = .systemGray
                            
                            let valueLabel = UILabel(frame: CGRect(x: tableView.frame.width - 200, y: 0, width: 130, height: 44))
                            valueLabel.text = "Tomioka Giyu"
                            valueLabel.font = .systemFont(ofSize: 17)
                            valueLabel.textAlignment = .right
                            
                            cell.contentView.addSubview(nameLabel)
                            cell.contentView.addSubview(valueLabel)
                            cell.textLabel?.text = ""  // Clear default label
                            
                        
                    case 1:
                            // For the Name row
                            let nameLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 100, height: 44))
                            nameLabel.text = "Height"
                            nameLabel.font = .systemFont(ofSize: 17)
                            nameLabel.textColor = .systemGray
                            
                            let valueLabel = UILabel(frame: CGRect(x: tableView.frame.width - 200, y: 0, width: 130, height: 44))
                            valueLabel.text = "165 cm"
                            valueLabel.font = .systemFont(ofSize: 17)
                            valueLabel.textAlignment = .right
                            
                            cell.contentView.addSubview(nameLabel)
                            cell.contentView.addSubview(valueLabel)
                            cell.textLabel?.text = ""  // Clear default label
                    case 2:
                        // For the Name row
                            let nameLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 100, height: 44))
                            nameLabel.text = "Weight"
                            nameLabel.font = .systemFont(ofSize: 17)
                            nameLabel.textColor = .systemGray
                
                            let valueLabel = UILabel(frame: CGRect(x: tableView.frame.width - 200, y: 0, width: 130, height: 44))
                            valueLabel.text = "65.5 kg"
                            valueLabel.font = .systemFont(ofSize: 17)
                            valueLabel.textAlignment = .right
                
                            cell.contentView.addSubview(nameLabel)
                            cell.contentView.addSubview(valueLabel)
                            cell.textLabel?.text = ""  // Clear default label
                        
                    case 3:
                       // For the Name row
                            let nameLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 100, height: 44))
                            nameLabel.text = "Email-id"
                            nameLabel.font = .systemFont(ofSize: 17)
                            nameLabel.textColor = .systemGray
        
                            let valueLabel = UILabel(frame: CGRect(x: tableView.frame.width - 200, y: 0, width: 130, height: 44))
                            valueLabel.text = "shinobu@gmail.com"
                            valueLabel.font = .systemFont(ofSize: 17)
                            valueLabel.textAlignment = .right
        
                            cell.contentView.addSubview(nameLabel)
                            cell.contentView.addSubview(valueLabel)
                            cell.textLabel?.text = ""  // Clear default label
                    case 4:
                        
                            let nameLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 100, height: 44))
                            nameLabel.text = "Phone no"
                            nameLabel.font = .systemFont(ofSize: 17)
                            nameLabel.textColor = .systemGray

                            let valueLabel = UILabel(frame: CGRect(x: tableView.frame.width - 200, y: 0, width: 130, height: 44))
                            valueLabel.text = "+91729090089"
                            valueLabel.font = .systemFont(ofSize: 17)
                            valueLabel.textAlignment = .right

                            cell.contentView.addSubview(nameLabel)
                            cell.contentView.addSubview(valueLabel)
                            cell.textLabel?.text = ""  // Clear default label
                    default:
                        cell.textLabel?.text = ""
                    }
            return cell
        }
        
        
        
        let cell = UITableViewCell()

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 && indexPath.row == 0 {
                handleImageSelection()
            } else if indexPath.section == 1 {
                switch indexPath.row {
                case 1: // Height
                    showPicker(for: "height")
                case 2: // Weight
                    showPicker(for: "weight")
                default:
                    break
                }
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        // Add this new method for showing the picker
        private func showPicker(for field: String) {
            let pickerVC = ProfilePickerViewController(field: field)
            pickerVC.delegate = self
            pickerVC.modalPresentationStyle = .pageSheet
            
            if let sheet = pickerVC.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
            
            present(pickerVC, animated: true)
        }
    
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 170
            }
        }
        return 44
    }
    
    // Add section spacing
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //return section == 0 ? 0 : 0
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        //return 8
        return 1
    }

    // Style the section headers
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }

    // Add rounded corners to sections
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isFirstCell = indexPath.row == 0
        let isLastCell = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        
        if isFirstCell {
            cell.layer.cornerRadius = 10
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            cell.clipsToBounds = true
        }
        
        if isLastCell {
            cell.layer.cornerRadius = 10
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            cell.clipsToBounds = true
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
