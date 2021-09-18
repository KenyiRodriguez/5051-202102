//
//  HomeViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 17/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func clickBtnShowMessage(_ sender: Any) {
        self.showAlertWithTitle("HOLA!", message: "Esta es mi primera alerta!", cancelButton: "Aceptar")
    }
}
