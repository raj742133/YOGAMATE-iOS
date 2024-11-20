//
//  ViewController.swift
//  test-yoga5
//
//  Created by user@22 on 04/11/24.
//

import UIKit

class HomeScreenViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yogatitle.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.yogatitle.text = yogatitle[indexPath.row]
        cell.yogasubtitle.text = yogasubtitle[indexPath.row]
        cell.yogaimg.image = UIImage(named: yogaimage[indexPath.row])
        cell.yogaimg.contentMode = .scaleAspectFill
        cell.yogaimg.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
        
        vc.mimg = UIImage(named: yogaimage[indexPath.row]) // Pass the image
        vc.mdesc = YogaData.yogadescriptions[indexPath.row] // Pass the description
        vc.videoFileName = YogaData.yogavideo[indexPath.row] // Pass the video file name
        self.navigationController?.pushViewController(vc, animated: true)
    }


    
    
    
    var yogatitle = YogaData.yogatitle
    var yogaimage = YogaData.yogaimage
    var yogasubtitle = YogaData.yogasubtitle
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var progressPlaceholderView: UIView!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var lifeExpectancyLabel: UILabel!
    
    @IBOutlet weak var extendedLifeLabel: UILabel!
    
    
    @IBOutlet weak var timeProgreesPlaceholderView: UIView!
    // Sample data for testing
    var progressData = ProgressDataModel(completed: 6, inProgress: 2, remaining: 1, totalTime: 22, completedTime: 18)
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = getCurrentDate()
        
        navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.title = "Good Morning"
        
        // Display the data in the UI
        updateUI(with: progressData)
        
        // Creating circular progress indicators based on completion percentages
        createCircularProgress(view: progressPlaceholderView, radius: 56, lineWidth: 7, progress: progressData.completionPercentage, duration: 1.5, color: .systemPink, backgroundColor: UIColor.systemPink.withAlphaComponent(0.2)) // Task completion progress
        createCircularProgress(view: progressPlaceholderView, radius: 41, lineWidth: 7, progress: progressData.completionPercentage, duration: 1.5, color: .systemTeal, backgroundColor: UIColor.systemTeal.withAlphaComponent(0.2))
        
        /*createCircularProgress(view: progressPlaceholderView, radius: 26, lineWidth: 7, progress: progressData.timeCompletionPercentage, duration: 1.5, color: .systemYellow, backgroundColor: UIColor.systemYellow.withAlphaComponent(0.2))*/ // Time completion progress
        
        createCircularProgress(view: progressPlaceholderView, radius: 71, lineWidth: 7, progress: progressData.timeCompletionPercentage, duration: 1.5, color: .systemGreen, backgroundColor: UIColor.systemGreen.withAlphaComponent(0.2))
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 2 // Two items per row
            let padding: CGFloat = 6 // Adjust padding here to reduce spacing
            let totalPadding = padding * (itemsPerRow + 1)
            let availableWidth = collectionView.frame.width - totalPadding
            let itemWidth = availableWidth / itemsPerRow
            //collectionView.layoutIfNeeded()

            
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 70) // Adjust height if needed
            layout.minimumInteritemSpacing = padding / 2 // Reduce spacing between items
            layout.minimumLineSpacing = padding // Reduce spacing between rows
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            //collectionView.reloadData()
            
            
        
        }
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        
        // Set the desired date format
        formatter.dateFormat = "EEEE dd MMM" // Full day, day of the month, short month
        
        // Set the locale to ensure correct formatting
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter.string(from: currentDate).uppercased()
    }

    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let accessoryView = UIButton()
        let image = UIImage(named:"profile")
        
        accessoryView.setImage(image, for: .normal)
        accessoryView.frame.size = CGSize(width: 34, height: 34)
        accessoryView.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        let largeTitleView = navigationController?.navigationBar.subviews.first { subview in
            return String(describing: type(of: subview)) == "_UINavigationBarLargeTitleView"
        }
        largeTitleView?.perform(Selector(("setAccessoryView:")), with: accessoryView)
        largeTitleView?.perform(Selector(("setAlignAccessoryViewToTitleBaseline:")), with: nil)
        largeTitleView?.perform(Selector(("updateContent")))
    }

    @objc private func profileButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileTableViewController {
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
    


    func updateUI(with data: ProgressDataModel) {
        // Set each label's text with bold styling for dynamic parts
        completedLabel.attributedText = createBoldAttributedText(labelText: "Completed: ", valueText: "\(data.completed)")
        inProgressLabel.attributedText = createBoldAttributedText(labelText: "In Progress: ", valueText: "\(data.inProgress)")
        remainingLabel.attributedText = createBoldAttributedText(labelText: "Remaining: ", valueText: "\(data.remaining)")
        timeLabel.attributedText = createBoldAttributedText(labelText: "Time: ", valueText: "\(data.completedTime)/\(data.totalTime) min")
        // Update life expectancy messages
            lifeExpectancyLabel.text = data.lifeExpectancy.lifeExpectancyMessage
            extendedLifeLabel.text = data.lifeExpectancy.extendedLifeMessage
    }

    func createBoldAttributedText(labelText: String, valueText: String) -> NSAttributedString {
        // Define the regular and bold fonts
        let regularFont = UIFont.systemFont(ofSize: 16)
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        
        // Regular part of the label
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: UIColor.label // System default text color
        ]
        let regularAttributedString = NSMutableAttributedString(string: labelText, attributes: regularAttributes)
        
        // Bold part of the label
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: boldFont,
            .foregroundColor: UIColor.label
        ]
        let boldAttributedString = NSAttributedString(string: valueText, attributes: boldAttributes)
        
        // Combine the regular and bold parts
        regularAttributedString.append(boldAttributedString)
        return regularAttributedString
    }

    
    func createCircularProgress(view: UIView, radius: CGFloat, lineWidth: CGFloat, progress: CGFloat, duration: CFTimeInterval, color: UIColor, backgroundColor: UIColor) {
        // Define the circle path based on the center and radius
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: view.bounds.midX, y: view.bounds.midY),
            radius: radius,
            startAngle: -CGFloat.pi / 2,    // Start at the top center
            endAngle: (2 * CGFloat.pi) - (CGFloat.pi / 2), // Complete circle
            clockwise: true
        )
        
        // Create a background layer for the full circle (uncompleted portion)
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = circlePath.cgPath
        backgroundLayer.strokeColor = backgroundColor.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.strokeEnd = 1.0  // Full circle for the background
        backgroundLayer.lineCap = .round  // Rounded corners for background layer
        
        // Add the background layer behind the progress layer
        view.layer.addSublayer(backgroundLayer)

        // Create the progress layer for the actual progress indicator
        let progressLayer = CAShapeLayer()
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeColor = color.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0  // Start with no progress
        progressLayer.lineCap = .round  // Rounded corners for progress layer
        
        // Add the progress layer to the provided view's layer
        view.layer.addSublayer(progressLayer)
        
        // Set up the animation for the progress
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnimation")
    }
    
    
    
    
}
