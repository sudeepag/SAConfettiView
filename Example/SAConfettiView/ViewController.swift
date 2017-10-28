//
//  ViewController.swift
//  SAConfettiView
//
//  Created by Sudeep Agarwal on 12/14/2015.
//  Copyright (c) 2015 Sudeep Agarwal. All rights reserved.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {
    
    var confettiView: SAConfettiView!
    var isRainingConfetti = false
    @IBOutlet var confettiStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create confetti view
        confettiView = SAConfettiView(frame: self.view.bounds)
        
        // Set colors (default colors are red, green and blue)
        confettiView.colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
                               UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
                               UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
                               UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
                               UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        
        // Set intensity (from 0 - 1, default intensity is 0.5)
        confettiView.intensity = 0.5
        
        // Set type
        confettiView.type = .diamond
        
        // For custom image
        // confettiView.type = .Image(UIImage(named: "diamond")!)
        
        // Add subview
        view.addSubview(confettiView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (isRainingConfetti) {
            // Stop confetti
            confettiView.stopConfetti()
            confettiStatus.text = "it's not raining confetti 🙁"
        } else {
            // Start confetti
            confettiView.startConfetti()
            confettiStatus.text = "it's raining confetti 🙂"
        }
        isRainingConfetti = !isRainingConfetti
    }
}

