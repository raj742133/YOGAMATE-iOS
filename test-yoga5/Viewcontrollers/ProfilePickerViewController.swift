//
//  ProfilePickerViewController.swift
//  test-yoga5
//
//  Created by user3 on 18/11/24.
//


import UIKit

class ProfilePickerViewController: UIViewController {
    private let pickerView = UIPickerView()
    private let toolBar = UIToolbar()
    private var values: [String] = []
    private let field: String
    weak var delegate: ProfilePickerDelegate?
    
    init(field: String) {
        self.field = field
        super.init(nibName: nil, bundle: nil)
        
        // Set up values based on field type
        if field == "height" {
            values = Array(140...220).map { "\($0) cm" }
        } else if field == "weight" {
            values = stride(from: 50.0, through: 100.0, by: 0.1).map { String(format: "%.1f kg", $0) }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
    }
    
    private func setupPicker() {
        view.backgroundColor = .systemBackground
        
        // Setup picker view
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup toolbar
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelButton, flexSpace, doneButton], animated: false)
        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup constraints
        NSLayoutConstraint.activate([
            toolBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            pickerView.topAnchor.constraint(equalTo: toolBar.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Try to set initial value
        if let currentValue = getCurrentValue() {
            if let index = values.firstIndex(of: currentValue) {
                pickerView.selectRow(index, inComponent: 0, animated: false)
            }
        }
    }
    
    private func getCurrentValue() -> String? {
        if let tableViewController = delegate as? EditProfileTableViewController {
            let row = field == "height" ? 1 : 2
            if let cell = tableViewController.tableView.cellForRow(at: IndexPath(row: row, section: 1)),
               let valueLabel = cell.contentView.subviews.last as? UILabel {
                return valueLabel.text
            }
        }
        return nil
    }
    
    @objc private func doneButtonTapped() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        delegate?.didSelectValue(values[selectedRow], for: field)
        dismiss(animated: true)
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
}

extension ProfilePickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
}
