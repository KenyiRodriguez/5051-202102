//
//  LoginViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 10/09/21.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBAction func clickBtnShowMessage(_ sender: Any) {
        self.showAlertWithTitle("HOLA!", message: "Esta es mi primera alerta!", cancelButton: "Aceptar")
    }
}
