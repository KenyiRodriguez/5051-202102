//
//  ViewController.swift
//  Constraints1
//
//  Created by Kenyi Rodriguez on 17/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var anchorheigth: NSLayoutConstraint!
    
    var isColapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func clickBtnAnimar(_ sender: Any) {
        
        self.isColapse = !self.isColapse
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseOut) {
            
            self.anchorheigth.constant = self.isColapse ? 400 : 120
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            print("Terminó de animar")
        }
    }
}


