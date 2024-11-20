//
//  Video.swift
//  test-yoga5
//
//  Created by user@22 on 18/11/24.
//

import Foundation
struct Video{
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    
    static func fetchvideos() -> [Video] {
        
        let v1 = Video(authorName: "User1", videoFileName: "Cobra", description: "This is a video", thumbnailFileName: "Cobra")
        let v2 = Video(authorName: "User2", videoFileName: "Crow", description: "This is a video", thumbnailFileName: "Crow")
        let v3 = Video(authorName: "User3", videoFileName: "Easy", description: "This is a video", thumbnailFileName: "Easy")
        let v4 = Video(authorName: "User4", videoFileName: "Mountain", description: "This is a video", thumbnailFileName: "Mountain")
        let v5 = Video(authorName: "User5", videoFileName: "Warriorii", description: "This is a video", thumbnailFileName: "Warrriorii")
        
        return [v1, v2, v3, v4, v5]
    }
        
}
