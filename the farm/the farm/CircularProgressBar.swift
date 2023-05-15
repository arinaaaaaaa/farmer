//
//  CircularProgressBar.swift
//  the farm
//
//  Created by arina on 05.05.2023.
//

import UIKit

class CircularProgressBar: UIView {

    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircularPath()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCircularPath()
    }

    private func makeCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: UIScreen.main.bounds.width*0.7/2, startAngle: -CGFloat.pi / 2, endAngle: 1.5*CGFloat.pi, clockwise: true)

        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor(red: 1.0, green: 0.82, blue: 0.56, alpha: 1.0).cgColor
        trackLayer.strokeColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0).cgColor
        trackLayer.lineWidth = 15.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)

        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor(red: 0.8, green: 0.52, blue: 0.19, alpha: 1.0).cgColor
        progressLayer.lineWidth = 15.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func animateProgress(withDuration duration: TimeInterval, progress: Float) {
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.duration = duration
        progressAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        progressAnimation.fromValue = progressLayer.strokeEnd
        progressAnimation.toValue = progress
        progressLayer.strokeEnd = CGFloat(progress)
        progressLayer.add(progressAnimation, forKey: "animateprogress")
    }
}
