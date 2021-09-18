//
//  DetailViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 10/09/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBAction func clickBtnClose(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
