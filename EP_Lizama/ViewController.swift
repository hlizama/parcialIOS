//
//  ViewController.swift
//  EP_Lizama
//
//  Created by user178474 on 10/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtMas: UILabel!
    
    var fullText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    var parcialText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has ..."
    @IBAction func btnVermas(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            
            if sender.tag == 0 {
                
                self.txtMas.text = self.fullText
                sender.tag = 1
                sender.setTitle("Ver menos", for: .normal)
                
            }else{
                
                self.txtMas.text = self.parcialText
                sender.tag = 0
                sender.setTitle("Ver más", for: .normal)
            }
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        
    }
    
    
    @IBOutlet weak var bottomScrollConst: NSLayoutConstraint!
    
    @IBAction func tapToClodeKeyboard(_ sender: Any) {
               self.view.endEditing(true)
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
        
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            
            NotificationCenter.default.removeObserver(self)
        }
        
        
        @objc func keyboardWillShow(_ notification: Notification) {
            
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            
            UIView.animate(withDuration: animationDuration) {
                self.bottomScrollConst.constant = keyboardFrame.height
                self.view.layoutIfNeeded()
            }
        }
        
        @objc func keyboardWillHide(_ notification: Notification) {
            
            let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            
            UIView.animate(withDuration: animationDuration) {
                self.bottomScrollConst.constant = 0
                self.view.layoutIfNeeded()
            }

        }
    
    


}

