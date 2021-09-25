//
//  HomeViewController.swift
//  Constraints2
//
//  Created by Kenyi Rodriguez on 24/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var anchorBottomScroll: NSLayoutConstraint!
    
    override func viewDidLoad() {
        //Se ejecuta una sola vez!!!! (like an oncreate)
        super.viewDidLoad()
    }
    
    //Estos métodos se ejecutan multiples veces
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

//MARK: - Other methods
extension HomeViewController {
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
}

//MARK: - Keyboard events
extension HomeViewController {
    
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
