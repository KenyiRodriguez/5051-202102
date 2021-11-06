//
//  MovieWS.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 22/10/21.
//

import Foundation
import Alamofire

struct MovieWS {
    
    func getAllMovies() {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request(urlString)
        
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                print("El servicio falló")
                return
            }
                
            let decoder = JSONDecoder()
            let page = try? decoder.decode(PageMoviesDTO.self, from: data)
            print(page ?? "Sin respuesta")
        }
    }
}
