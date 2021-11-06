//
//  ViewController.swift
//  SolucionParcial
//
//  Created by Kenyi Rodriguez on 22/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSeeMore: UIButton!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var anchorBottomScroll: NSLayoutConstraint!
    
    var isSeeMore = false
    
    @IBAction func clickBtnSeeMore(_ sender: Any) {
        self.isSeeMore = !self.isSeeMore
        self.lblContent.numberOfLines = self.isSeeMore ? 0 : 2
        
        let buttonTitle = self.isSeeMore ? "Ver menos" : "Ver más"
        self.btnSeeMore.setTitle(buttonTitle, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
}

//MARK: - Other methods
extension ViewController {
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
}

//MARK: - Keyboard events
extension ViewController {
    
    private func registerKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
     
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomScroll.constant = keyboardFrame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
   
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

