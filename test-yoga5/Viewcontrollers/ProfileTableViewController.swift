//
//  ProfileTableViewController.swift
//  test-yoga5
//
//  Created by user@30 on 18/11/24.
//


//
//  ProfileTableViewController.swift
//  FinalProfile
//
//  Created by Amit Gulati on 12/11/24.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            
           
        // Set up navigation bar
            title = "Profile"
            
            // Create custom back button view
            let backButtonView = UIView()
            
            // Create chevron image view
            let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.left"))
            chevronImageView.tintColor = .systemRed
            
            // Create label
            let titleLabel = UILabel()
            titleLabel.text = "Home"
            titleLabel.textColor = .systemRed
            titleLabel.font = .systemFont(ofSize: 17)
            
            // Create button
            let backButton = UIButton(type: .system)
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            
            // Add subviews
            backButtonView.addSubview(chevronImageView)
            backButtonView.addSubview(titleLabel)
            backButtonView.addSubview(backButton)
            
            // Set up constraints
            chevronImageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            backButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                chevronImageView.leadingAnchor.constraint(equalTo: backButtonView.leadingAnchor),
                chevronImageView.centerYAnchor.constraint(equalTo: backButtonView.centerYAnchor),
                
                titleLabel.leadingAnchor.constraint(equalTo: chevronImageView.trailingAnchor, constant: 8),
                titleLabel.centerYAnchor.constraint(equalTo: backButtonView.centerYAnchor),
                
                backButton.leadingAnchor.constraint(equalTo: backButtonView.leadingAnchor),
                backButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                backButton.topAnchor.constraint(equalTo: backButtonView.topAnchor),
                backButton.bottomAnchor.constraint(equalTo: backButtonView.bottomAnchor)
            ])
            
            // Create bar button item with custom view
            let barButtonItem = UIBarButtonItem(customView: backButtonView)
            navigationItem.leftBarButtonItem = barButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // Add the toggle action here
    @objc private func darkModeToggled(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            // Change app appearance based on switch state
            let window = UIApplication.shared.windows.first
            window?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 1
        }  else if section == 3 {
            return 1
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! ProfileTableViewCell
            cell.profileImage.image = UIImage(named: "profile pic")
            cell.nameLabel.text = "Name"
            cell.emailLabel.text = "Email"
            cell.nameLabel.font = .systemFont(ofSize: 20, weight: .medium)
            
           return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //cell.textLabel?.text = "Hello, World!"
            switch indexPath.row {
                    case 0:
                        cell.textLabel?.text = "Edit Profile"
                        cell.imageView?.image = UIImage(systemName: "pencil")
                    case 1:
                        cell.textLabel?.text = "Favorites"
                        cell.imageView?.image = UIImage(systemName: "star")
                    case 2:
                        cell.textLabel?.text = "Help"
                        cell.imageView?.image = UIImage(systemName: "questionmark.circle")
                    default:
                        cell.textLabel?.text = ""
                    }
            //cell.imageView?.image = UIImage(named: "profile")
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.font = .systemFont(ofSize: 17)
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Dark Mode"
            cell.imageView?.image = UIImage(systemName: "moonphase.first.quarter.inverse")
            cell.textLabel?.font = .systemFont(ofSize: 17)
            
            // Create and configure the UISwitch
                let toggleSwitch = UISwitch()
                toggleSwitch.addTarget(self, action: #selector(darkModeToggled(_:)), for: .valueChanged)
                toggleSwitch.isOn = false  // Set initial state
                toggleSwitch.onTintColor = .systemBlue  // Optional: customize color
                
                // Add the switch as the accessory view
                cell.accessoryView = toggleSwitch
            
            return cell
            
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Sign Out"
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.textColor = .systemRed  // Make sign out red
            cell.textLabel?.textAlignment = .center
            return cell

        }
        
        let cell = UITableViewCell()

        // Configure the cell...

        return cell

    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 130
            }
        }
        return 44
    }
    
    
    
    // Add these methods for section spacing
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 35  // Space at the top
        }
        return 25  // Space for other sections
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // Space between sections
    }

    // Add this for footer styling
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()  // Empty view for clean spacing
    }
    
    
    //adding heading USER
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "USER"
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            header.textLabel?.textColor = .gray
            // Add left padding to header text
            header.textLabel?.frame = CGRect(x: 16, y: header.frame.origin.y, width: header.frame.width - 32, height: header.frame.height)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {  // for second section
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "fromProfileToEdit", sender: nil)
            case 2:
                performSegue(withIdentifier: "fromProfileToHelp", sender: nil)
            case 1:
                performSegue(withIdentifier: "fromProfileToFav", sender: nil)
            
            default:
                break
            }
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
