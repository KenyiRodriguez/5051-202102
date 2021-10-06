//
//  LoginViewController.swift
//  MiPrimeraAplicacion
//
//  Created by Kenyi Rodriguez on 1/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var txtUser: UITextField!
    @IBOutlet weak private var txtPassword: UITextField!
    @IBOutlet weak private var anchorCenterYContent: NSLayoutConstraint!
    @IBOutlet weak private var viewContent: UIView!
    
    @IBAction private func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToOpenKeyboard(_ sender: Any) {
        self.txtUser.becomeFirstResponder()
    }
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        guard
            let user = self.txtUser.text, user.count != 0,
            let pass = self.txtPassword.text, pass.count != 0
        else {
            print("Credenciales incorrectas")
            return
        }
        
        self.performSegue(withIdentifier: "GoToHome", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregiterKeyboardNotification()
    }
}

extension LoginViewController {
    
    private func registerKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregiterKeyboardNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let finalPosYViewContent = self.viewContent.frame.origin.y + self.viewContent.frame.height
        
        if keyboardFrame.origin.y < finalPosYViewContent {
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.anchorCenterYContent.constant = keyboardFrame.origin.y - finalPosYViewContent
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorCenterYContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
