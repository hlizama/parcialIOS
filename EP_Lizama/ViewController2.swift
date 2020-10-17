//
//  ViewController2.swift
//  EP_Lizama
//
//  Created by user178474 on 10/16/20.
//

import UIKit

class ViewController2: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        
        
                //let width = self.view.frame.width
                //let height = self.view.frame.height
                
                //let posx = CGFloat.random(in: 0...width)
                //let posy = CGFloat.random(in: 0...height)
                
                let frame = CGRect(x: 100, y: 100, width: 80, height: 80)
                let boxView = BoxView(frame: frame)
                //boxView.delegate = self
                //self.view.addSubview(boxView)
                boxView.changeRandomBackgroundColor()
        
        
               super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

   

}

extension ViewController: BoxViewDelegate {
    
    func boxViewTapInView(_ boxView: BoxView) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            
            boxView.changeRandomBackgroundColor()
            boxView.changeRandomPosition()
            boxView.changeAngleRotation()
            
        }) { (_) in
            
            boxView.transform = .identity
        }
        
    }
}
