//
//  ViewController1.swift
//  test-yoga5
//
//  Created by user@22 on 18/11/24.
//
import AVKit
import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    var mimg: UIImage?
    var mdesc: String?
    var videoFileName: String?
    var mtitle: String?
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the background image and description
            titleLabel.text = mtitle
            descriptionLabel.text = mdesc
            imageView1.image = mimg
            
            // Optional: Style the play button
            configurePlayButton()
        }

        private func configurePlayButton() {
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal) // Add play icon
            playButton.tintColor = .white // Icon color
            /*playButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)*/ // Semi-transparent background
            playButton.layer.cornerRadius = playButton.frame.size.width / 2 // Make the button circular
        }

    @IBAction func stratButtontapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNextScreen", sender: self)
    }
    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        guard let videoFileName = videoFileName else {
                print("Video file name is nil")
                return
            }
            if let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: nil) {
                let player = AVPlayer(url: videoURL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                present(playerViewController, animated: true) {
                    player.play()
                }
            } else {
                print("Video file not found in the bundle: \(videoFileName)")
            }
    }
    
    
}
