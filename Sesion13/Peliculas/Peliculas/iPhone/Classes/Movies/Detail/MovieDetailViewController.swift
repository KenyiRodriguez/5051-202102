//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 12/11/21.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var imgMovieBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet var arrayStars: [UIImageView]!
    
    var objMovie: Movie! //Esta propiedad es necesaría para que la clase funcione
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgMovie.layer.cornerRadius = 10
        self.updateData()
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateData() {
        
        self.lblTitle.text = self.objMovie.name
        self.lblReleaseDate.text = self.objMovie.releaseDateFormat
        self.lblOverview.text = self.objMovie.overview
        
        for (index, imgStar) in self.arrayStars.enumerated() {
            imgStar.image = index < self.objMovie.voteAverage ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        let request = AF.request(self.objMovie.urlImage)
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                self.imgMovie.image = nil
                self.imgMovieBackground.image = nil
                return
            }
            
            let image = UIImage(data: data)
            self.imgMovie.image = image
            self.imgMovieBackground.image = image
        }
    }
}
