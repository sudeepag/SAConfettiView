//
//  ConfettiType.swift
//  Pods
//
//  Created by Kyle McAlpine on 18/05/2016.
//
//

import UIKit

public enum ConfettiType {
    case Confetti
    case Triangle
    case Star
    case Diamond
    case Image(UIImage)
    
    var image: UIImage? {
        var imageName: String!
        
        switch self {
        case .Confetti:
            imageName = "confetti"
        case .Triangle:
            imageName = "triangle"
        case .Star:
            imageName = "star"
        case .Diamond:
            imageName = "diamond"
        case let .Image(customImage):
            return customImage
        }
        
        return UIImage(named: imageName)
    }
}
