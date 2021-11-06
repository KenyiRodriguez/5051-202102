//
//  ViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 22/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieWS = MovieWS()
        movieWS.getAllMovies()
    }


}

