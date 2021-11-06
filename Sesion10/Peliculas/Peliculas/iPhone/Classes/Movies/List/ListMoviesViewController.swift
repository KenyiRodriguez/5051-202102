//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 5/11/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet weak var tlvMovies: UITableView!
    
    var arrayMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllMovies()
    }
    
    func getAllMovies() {
        
        let webService = MovieWS()
        webService.getAllMovies { arrayMoviesDTO in
            self.arrayMovies = arrayMoviesDTO.toMovies
            self.tlvMovies.reloadData()
        }
    }
}

extension ListMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieTableViewCell.createInTableView(tableView, indexPath: indexPath, objMovie: self.arrayMovies[indexPath.row])
    }
}
