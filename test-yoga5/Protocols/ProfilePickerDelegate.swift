//
//  ProfilePickerDelegate.swift
//  test-yoga5
//
//  Created by user3 on 18/11/24.
//

import Foundation

protocol ProfilePickerDelegate: AnyObject {
    func didSelectValue(_ value: String, for field: String)
}
