//
//  InformationViewController.swift
//  Peliculas
//
//  Created by Angel Kenyi Rodriguez Vergara on 19/11/21.
//

import UIKit
 
class InformationViewController: UIViewController {
    
    @IBAction private func clickBtnCloseSession(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
