//
//  ListMoviesViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 5/11/21.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet weak var tlvMovies: UITableView!
    private lazy var listAdapter = ListMoviesAdapter(controller: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listAdapter.setTableView(self.tlvMovies)
        self.getAllMovies()
    }
    
    func getAllMovies() {
        
        let webService = MovieWS()
        webService.getAllMovies { arrayMoviesDTO in
            self.listAdapter.arrayMovies = arrayMoviesDTO.toMovies
            self.tlvMovies.reloadData()
        }
    }
    
    func goToMovieDetail(_ objMovie: Movie) {
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? Movie {
            controller.objMovie = objMovie
        }
    }
}



