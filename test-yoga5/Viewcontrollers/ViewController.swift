//
//  ViewController.swift
//  test-yoga5
//
//  Created by user@22 on 04/11/24.
//


import UIKit

class ViewController: UIViewController,UIContextMenuInteractionDelegate,UITableViewDataSource, UITableViewDelegate  {
    
    let data: [Poses] = posess
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routinecell", for: indexPath) as! RoutineTableViewCell
        
        cell.poseImg.image = UIImage(named: data[indexPath.row].imageName)
        cell.name.text = data[indexPath.row].name
        
        return cell
    }

    @IBOutlet weak var progressPlaceholderView: UIView!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var lifeExpectancyLabel: UILabel!
    
    @IBOutlet weak var extendedLifeLabel: UILabel!
    
    @IBOutlet weak var selectedDateLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var routineMenu: UIButton!
    
    @IBAction func routineMenuTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
            }
        })
    }
    
    
    private var collectionView: UICollectionView!
    private var headerLabel: UILabel!
    private var currentDate: Date = Date()
    private var dates: [Date?] = []
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
    private let dayLabels = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    
 
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
            let changeRoutine = UIAction(title: "Change Routine", image: UIImage(systemName: "checkmark.circle")) { _ in
                self.navigateToBuildRoutine()
            }

            let viewCalendar = UIAction(title: "View Calendar", image: UIImage(systemName: "calendar.circle")) { _ in
                self.presentCalendar()
            }

            let viewLeaderboard = UIAction(title: "View Leaderboard", image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle")) { _ in
                print("View Leaderboard tapped")
            }

            return UIMenu(title: "Menu", children: [changeRoutine, viewCalendar, viewLeaderboard])
        }
    }
    
    func navigateToBuildRoutine() {
        // Instantiate BuildRoutineViewController from the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name if different
        guard let buildRoutineVC = storyboard.instantiateViewController(withIdentifier: "BuildRoutineViewController") as? BuildRoutineViewController else {
            print("BuildRoutineViewController could not be found.")
            return
        }

        // Push BuildRoutineViewController onto the navigation stack
        self.navigationController?.pushViewController(buildRoutineVC, animated: true)
    }

    
  
  
    
    
    
   
   /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSizeZero
        }
        collectionView.dataSource = self
        collectionView.delegate = self
    }*/
    
    var progressData = ProgressDataModel(completed: 6, inProgress: 2, remaining: 1, totalTime: 22, completedTime: 18)
    
    var poses: [Pose] = [
        Pose(name: "Downward Dog", imageName: "downward_dog"),
        Pose(name: "Warrior II", imageName: "warrior_ii"),
        Pose(name: "Tree Pose", imageName: "tree_pose"),
        Pose(name: "Bridge Pose", imageName: "bridge_pose"),
        // Add more poses as needed
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the data in the UI
        updateUI(with: progressData)
        
        // Creating circular progress indicators based on completion percentages
        createCircularProgress(view: progressPlaceholderView, radius: 67, lineWidth: 12, progress: progressData.completionPercentage, duration: 1.5, color: .systemPink, backgroundColor: UIColor.systemPink.withAlphaComponent(0.2)) // Task completion progress
        createCircularProgress(view: progressPlaceholderView, radius: 52, lineWidth: 12, progress: progressData.completionPercentage, duration: 1.5, color: .systemTeal, backgroundColor: UIColor.systemTeal.withAlphaComponent(0.2))
        
        createCircularProgress(view: progressPlaceholderView, radius: 37, lineWidth: 12, progress: progressData.timeCompletionPercentage, duration: 1.5, color: .systemYellow, backgroundColor: UIColor.systemYellow.withAlphaComponent(0.2)) // Time completion progress
        
        /*createCircularProgress(view: progressPlaceholderView, radius: 22, lineWidth: 12, progress: progressData.timeCompletionPercentage, duration: 1.5, color: .systemGreen, backgroundColor: UIColor.systemGreen.withAlphaComponent(0.2))*/
        
        let contextMenuInteraction = UIContextMenuInteraction(delegate: self)
        routineMenu.addInteraction(contextMenuInteraction)
        routineMenu.showsMenuAsPrimaryAction = true
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
        
        selectedDateLabel.text = ""
        
        
        
        
        
        
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
    
    // MARK: - Show Date Picker
    func showDatePicker() {
        let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        alert.view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 8),
            datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -8),
            datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 45),
            datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            self.handleDateSelection(datePicker.date) // Update the label here
        }
        alert.addAction(selectAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let heightConstraint = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alert.view.addConstraint(heightConstraint)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    func handleDateSelection(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none // Only show the date, no time
        let formattedDate = dateFormatter.string(from: date)
        
        // Update the selectedDateLabel with the formatted date
        selectedDateLabel.text = formattedDate
    }


    
    
    
    
    func presentCalendar() {
        let alert = UIAlertController(title: "Select a Date", message: nil, preferredStyle: .alert)
        
        // Create a UIDatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the date picker to the alert
        alert.view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 8),
            datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -8),
            datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 50),
            datePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -60)
        ])
        
        // Add "Select" and "Cancel" actions
        let selectAction = UIAlertAction(title: "Select", style: .default) { _ in
            let selectedDate = datePicker.date
            self.handleDateSelection(selectedDate)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)
        
        // Adjust alert height and present it
        let heightConstraint = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alert.view.addConstraint(heightConstraint)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

