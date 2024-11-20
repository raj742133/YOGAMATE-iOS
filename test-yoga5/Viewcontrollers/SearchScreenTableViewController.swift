//
//  SearchScreenTableViewController.swift
//  test-yoga5
//
//  Created by user3 on 16/11/24.
//

import UIKit

class SearchScreenTableViewController: UITableViewController, UISearchResultsUpdating {
    var filteredPoses: [Poses] = []
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search poses..."
        
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredPoses.count : posess.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "poseCell", for: indexPath) as! SearchScreenTableViewCell
        
        let pose: Poses
        if searchController.isActive {
            pose = filteredPoses[indexPath.row]
        } else {
            pose = posess[indexPath.row]
        }
        
        cell.poseLabel.text = pose.name
        cell.poseImage.image = UIImage(named: pose.imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected pose
        let selectedPose: Poses
        if searchController.isActive {
            selectedPose = filteredPoses[indexPath.row]
        } else {
            selectedPose = posess[indexPath.row]
        }
        
        // Perform the segue
        performSegue(withIdentifier: "showPoseDetails", sender: selectedPose)
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPoseDetails" {
            if let SearchPoseVC = segue.destination as? SearchPoseViewController {
                if let selectedPose = sender as? Poses {
                    SearchPoseVC.poses = selectedPose
                }
            }
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        filteredPoses = posess.filter { pose in
            return pose.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}

