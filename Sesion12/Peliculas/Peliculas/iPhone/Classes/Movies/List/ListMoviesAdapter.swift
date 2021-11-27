//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by Angel Kenyi Rodriguez Vergara on 19/11/21.
//

import Foundation
import UIKit

class ListMoviesAdapter: NSObject {
    
    var arrayMovies = [Movie]()
    private unowned let controller: ListMoviesViewController
    
    init(controller: ListMoviesViewController) {
        self.controller = controller
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListMoviesAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieTableViewCell.createInTableView(tableView, indexPath: indexPath, objMovie: self.arrayMovies[indexPath.row])
    }
}

extension ListMoviesAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToMovieDetail(objMovie)
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
            self.controller.goToMovieDetail(objMovie)
        }
        detailAction.backgroundColor = .systemIndigo
        detailAction.image = UIImage(systemName: "table.badge.more")?.withTintColor(.white)
        
        
        let swipActionsConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, detailAction])
        return swipActionsConfiguration
    }
}
