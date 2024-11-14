//
//  dataModel.swift
//  YogaMate
//
//  Created by user3 on 05/11/24.
//

import Foundation

struct dataModel {
    enum AgeGroup: String, CaseIterable {
        case age18to24 = "18-24"
        case age25to29 = "25-29"
        case age30to34 = "30-34"
        case age35to39 = "35-39"
        case age40to44 = "40-44"
        
        static var allStrings: [String] {
            return Self.allCases.map { $0.rawValue }
        }
    }
    
    enum Session: String, CaseIterable {
        case morning = "Morning"
        case afternoon = "Afternoon"
        case evening = "Evening"
        
        static var allStrings: [String] {
            return Self.allCases.map { $0.rawValue }
        }
    }
    
    enum Duration: String, CaseIterable {
        case tenMin = "10 minutes"
        case twentyMin = "20 minutes"
        case thirtyMin = "30 minutes"
        case fortyMin = "40 minutes"
        case fiftyMin = "50 minutes"
        
        static var allStrings: [String] {
            return Self.allCases.map { $0.rawValue }
        }
    }
    
    enum ExperienceLevel: String, CaseIterable {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
        
        static var allStrings: [String] {
            return Self.allCases.map { $0.rawValue }
        }
    }
    
    // Selected values
    var selectedAgeGroup: AgeGroup?
    var selectedSession: Session?
    var selectedDuration: Duration?
    var selectedExperienceLevel: ExperienceLevel?
    
    // Validation
    var isSelectionComplete: Bool {
        return selectedAgeGroup != nil &&
               selectedSession != nil &&
               selectedDuration != nil &&
               selectedExperienceLevel != nil
    }
}

