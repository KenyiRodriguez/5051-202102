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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? MovieDetailViewController, let objMovie = sender as? Movie {
            controller.objMovie = objMovie
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

extension ListMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objMovie = self.arrayMovies[indexPath.row]
        self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { _, _, _ in
            
            self.arrayMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Consumo un servicio que lo elimina del servidor
        }
        
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash")
        
        
        let detailAction = UIContextualAction(style: .normal, title: "Ver Detalle") { _, _, _ in
            let objMovie = self.arrayMovies[indexPath.row]
            self.performSegue(withIdentifier: "MovieDetailViewController", sender: objMovie)
        }
        detailAction.backgroundColor = .systemIndigo
        detailAction.image = UIImage(systemName: "table.badge.more")?.withTintColor(.white)
        
        
        let swipActionsConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, detailAction])
        return swipActionsConfiguration
    }
}
