//
//  ViewController.swift
//  YogaMate
//
//  Created by user3 on 03/11/24.
//

import UIKit

class BuildRoutineViewController: UIViewController {
    
    @IBOutlet weak var ageGroupButton: UIButton!
    @IBOutlet weak var sessionButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var experienceLevelButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
  
    var yogaData = dataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    private func setupUI() {
        setupButtons()
        setupContinueButton()
    }
        
    private func setupButtons() {
        // Configure selection buttons
        [ageGroupButton, sessionButton, timeButton, experienceLevelButton].forEach { button in
            button?.backgroundColor = .systemGray6
            button?.layer.cornerRadius = 8
            
            // Create and set button configuration
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            button?.configuration = config
            
            button?.contentHorizontalAlignment = .left
            button?.setTitleColor(.black, for: .normal)
        }
        
        // Set default titles
        ageGroupButton.setTitle("Please Select", for: .normal)
        sessionButton.setTitle("Choose Session", for: .normal)
        timeButton.setTitle("Choose Time", for: .normal)
        experienceLevelButton.setTitle("Please Select", for: .normal)
    }
        
    func setupContinueButton() {
        continueButton.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0.4, alpha: 1.0)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 8
    }
    
// MARK: - Actions of Buttons
    
    @IBAction func ageGroupTapped(_ sender: UIButton) {
        showPicker(title: "Select Age Group",
                   options: dataModel.AgeGroup.allStrings) { [weak self] selected in
            self?.ageGroupButton.setTitle(selected, for: .normal)
            self?.yogaData.selectedAgeGroup = dataModel.AgeGroup.allCases.first { $0.rawValue == selected }
            self?.updateContinueButtonState()
        }
    }
    
    @IBAction func sessionTapped(_ sender: UIButton) {
        showPicker(title: "Choose Session",
                   options: dataModel.Session.allStrings) { [weak self] selected in
            self?.sessionButton.setTitle(selected, for: .normal)
            self?.yogaData.selectedSession = dataModel.Session.allCases.first { $0.rawValue == selected }
            self?.updateContinueButtonState()
        }
    }
    
    @IBAction func timeTapped(_ sender: UIButton) {
        showPicker(title: "Select Time",
                   options: dataModel.Duration.allStrings) { [weak self] selected in
            self?.timeButton.setTitle(selected, for: .normal)
            self?.yogaData.selectedDuration = dataModel.Duration.allCases.first { $0.rawValue == selected }
            self?.updateContinueButtonState()
        }
    }
    
    @IBAction func experienceLevelTapped(_ sender: UIButton) {
        showPicker(title: "Select Experience",
                   options: dataModel.ExperienceLevel.allStrings) { [weak self] selected in
            self?.experienceLevelButton.setTitle(selected, for: .normal)
            self?.yogaData.selectedExperienceLevel = dataModel.ExperienceLevel.allCases.first { $0.rawValue == selected }
            self?.updateContinueButtonState()
        }
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
                tabBarController.modalPresentationStyle = .fullScreen
                
                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                   let window = sceneDelegate.window {
                    window.rootViewController = tabBarController
                    
                    UIView.transition(with: window,
                                    duration: 0.3,
                                    options: .transitionCrossDissolve,
                                    animations: nil,
                                    completion: nil)
            }
        }
    }
    
    private func showPicker(title: String, options: [String], completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        options.forEach { option in
            alert.addAction(UIAlertAction(title: option, style: .default) { _ in
                completion(option)
            })
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
        
    private func updateContinueButtonState() {
        continueButton.isEnabled = yogaData.isSelectionComplete
        continueButton.alpha = yogaData.isSelectionComplete ? 1.0 : 0.5
    }
}
