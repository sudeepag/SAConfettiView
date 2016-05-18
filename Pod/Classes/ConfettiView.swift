//
//  ConfettiView.swift
//  Pods
//
//  Created by Sudeep Agarwal on 12/14/15.
//
//

import UIKit
import QuartzCore

public class ConfettiView: UIView {
    let emitter = CAEmitterLayer()
    public var colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
                         UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
                         UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
                         UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
                         UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
    public var intensity: Float =  0.5
    public var type: ConfettiType!
    private(set) var active = false
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
    }

    public func startConfetti() {
        guard !active else { return }
        
        var cells = [CAEmitterCell]()
        for color in colors {
            cells.append(confettiWithColor(color))
        }
        
        emitter.beginTime = CACurrentMediaTime()
        emitter.emitterCells = cells
        layer.addSublayer(emitter)
        active = true
    }

    public func stopConfetti() {
        guard active else { return }
        
        emitter.birthRate = 0
        active = false
    }

    func confettiWithColor(color: UIColor) -> CAEmitterCell {
        let confetti = CAEmitterCell()
        confetti.birthRate = 6.0 * intensity
        confetti.lifetime = 14.0 * intensity
        confetti.lifetimeRange = 0
        confetti.color = color.CGColor
        confetti.velocity = CGFloat(350.0 * intensity)
        confetti.velocityRange = CGFloat(80.0 * intensity)
        confetti.emissionLongitude = CGFloat(M_PI)
        confetti.emissionRange = CGFloat(M_PI_4)
        confetti.spin = CGFloat(3.5 * intensity)
        confetti.spinRange = CGFloat(4.0 * intensity)
        confetti.scaleRange = CGFloat(intensity)
        confetti.scaleSpeed = CGFloat(-0.1 * intensity)
        confetti.contents = type.image!.CGImage
        return confetti
    }
}
