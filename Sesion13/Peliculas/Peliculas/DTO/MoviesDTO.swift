//
//  MoviesDTO.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 22/10/21.
//

import Foundation

struct PageMoviesDTO: Decodable {
    
    let page: Int?
    let results: [MovieDTO]?
    let total_pages: Int?
    let total_results: Int?
}

struct MovieDTO: Decodable {
    
    let id: Int?
    let title: String?
    let poster_path: String?
    let overview: String?
    let release_date: String?
    let vote_average: Double?
}
