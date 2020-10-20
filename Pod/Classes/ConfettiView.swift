//
//  ConfettiView.swift
//  Pods
//
//  Created by Sudeep Agarwal on 12/14/15.
//
//

import UIKit
import QuartzCore

open class ConfettiView: UIView {

    public struct Options {
        public var birthRate: Float = 6
        public var lifetime: Float = 14.0
        public var lifetimeRange: Float = 0
        public var alphaRange: Float = 0
        public var alphaSpeed: Float = 0
        public var velocity: Float = 350.0
        public var velocityRange: Float = 80.0
        public var emissionLongitude: Double = Double.pi
        public var emissionRange: Double = Double.pi
        public var spin: Float = 3.5
        public var spinRange: Float = 4.0
        public var scaleRange: Float = 1
        public var scaleSpeed: Float = -0.1
        public var yAcceleration: CGFloat = 0
        public var xAcceleration: CGFloat = 0
        public var zAcceleration: CGFloat = 0
        
        public var width: CGFloat? = nil
    }
    
    public static var defaultOptions = Options()
    public static var burstOptions: Options = {
        var options = Options()
        options.birthRate = 320
        options.velocity = 300
        options.lifetime = 10
        options.alphaRange = 8
        options.alphaSpeed = -0.5
        
        return options
    }()
    
    public enum ConfettiType {
        case confetti
        case triangle
        case star
        case diamond
        case rectangle
        case image(UIImage)
    }

    var emitter: CAEmitterLayer!
    open var colors: [UIColor]!
    open var intensity: Float!
    open var type: ConfettiType!
    fileprivate var active :Bool!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup() {
        colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
            UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
            UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
            UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
            UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        intensity = 0.5
        type = .confetti
        active = false
    }
    
    open func burst(duration: TimeInterval = 0.3, complete: (() -> Void)? = nil) {
        start(options: ConfettiView.burstOptions)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
            self?.stop()
            complete?()
        }
    }

    open func start(options: Options = ConfettiView.defaultOptions) {
        emitter?.birthRate = 0
        emitter = CAEmitterLayer()

        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: options.width ?? frame.size.width, height: 1)
        emitter.beginTime = CACurrentMediaTime() - 0
        
        var cells = [CAEmitterCell]()
        for color in colors {
            cells.append(confetti(color: color, options: options))
        }

        emitter.emitterCells = cells
        layer.addSublayer(emitter)
        active = true
    }

    open func stop() {
        emitter?.birthRate = 0
        active = false
    }

    func imageForType(_ type: ConfettiType) -> UIImage? {

        let fileName: String
        let fileType: String

        switch type {
        case .confetti:
            fileName = "confetti"
            fileType = "png"
        case .triangle:
            fileName = "triangle"
            fileType = "png"
        case .star:
            fileName = "star"
            fileType = "png"
        case .diamond:
            fileName = "diamond"
            fileType = "png"
        case .rectangle:
            fileName = "rectangle"
            fileType = "pdf"
        case let .image(customImage):
            return customImage
        }

        let bundle = Bundle(for: ConfettiView.self)
        let imagePath = bundle.path(forResource: fileName, ofType: fileType)
        let url = URL(fileURLWithPath: imagePath!)
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            print(error)
        }
        return nil
    }

    func confetti(color: UIColor, options: Options) -> CAEmitterCell {
        let confetti = CAEmitterCell()
        // Vary each color with a slightly different birth rate so they don't come in waves
        confetti.birthRate = (options.birthRate + Float(arc4random()) / Float(UINT32_MAX)) * intensity
        confetti.lifetime = options.lifetime * intensity
        confetti.lifetimeRange = options.lifetimeRange
        confetti.alphaRange = options.alphaRange * intensity
        confetti.alphaSpeed = options.alphaSpeed * intensity
        confetti.color = color.cgColor
        confetti.velocity = CGFloat(options.velocity * intensity)
        confetti.velocityRange = CGFloat(options.velocityRange)
        confetti.emissionLongitude = CGFloat(options.emissionLongitude)
        confetti.emissionRange = CGFloat(options.emissionRange)
        confetti.spin = CGFloat(options.spin * intensity)
        confetti.spinRange = CGFloat(options.spinRange * intensity)
        confetti.scaleRange = CGFloat(options.scaleRange * intensity)
        confetti.scaleSpeed = CGFloat(options.scaleSpeed * intensity)
        confetti.contents = imageForType(type)!.cgImage
        confetti.yAcceleration = options.yAcceleration
        confetti.zAcceleration = options.zAcceleration
        confetti.xAcceleration = options.xAcceleration
        
        return confetti
    }

    open func isActive() -> Bool {
    		return self.active
    }
}
