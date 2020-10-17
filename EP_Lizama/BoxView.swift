//
//  Box1ViewController.swift
//  EP_Lizama
//
//  Created by user178474 on 10/16/20.
//

import UIKit


protocol BoxViewDelegate {
    func boxViewTapInView(_ boxView: BoxView)
//    func boxView(_ boxView: BoxView, animationDidFinish finish: Bool)
}

class BoxView: UIView {

    var delegate: BoxViewDelegate?
       
       override func draw(_ rect: CGRect) {
           
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapViewGesture))
           self.addGestureRecognizer(tapGesture)
       }
       
       @objc func tapViewGesture() {
           self.delegate?.boxViewTapInView(self)
       }
       
       func changeAngleRotation() {
           
           self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
       }
       
       func changeRandomPosition() {
           
           let width = self.superview?.frame.width ?? 0
           let height = self.superview?.frame.height ?? 0
           
           let posx = CGFloat.random(in: 0...width)
           let posxy = CGFloat.random(in: 0...height)
           
           self.center = CGPoint(x: posx, y: posxy)
       }
       
       func changeRandomBackgroundColor() {
           
           let r = CGFloat.random(in: 0...255) / 255.0
           let g = CGFloat.random(in: 0...255) / 255.0
           let b = CGFloat.random(in: 0...255) / 255.0
           
           self.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
       }
    

    

}
