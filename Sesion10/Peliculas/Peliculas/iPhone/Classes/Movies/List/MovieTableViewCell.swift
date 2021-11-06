//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 5/11/21.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    func updateData(_ objMovie: Movie) {
        
        self.animateAppear()
        
        self.lblTitle.text = objMovie.name
        self.lblReleaseDate.text = objMovie.releaseDateFormat
        
        let request = AF.request(objMovie.urlImage)
        request.response { dataResponse in
            
            guard let data = dataResponse.data else {
                self.imgMovie.image = nil
                return
            }
            
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    func animateAppear() {
        
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: -100, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieTableViewCell {
    
    class func createInTableView(_ tableView: UITableView, indexPath: IndexPath, objMovie: Movie) -> UITableViewCell {

        let cellIdentifier = "MovieTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MovieTableViewCell
        cell?.updateData(objMovie)
        return cell ?? MovieTableViewCell()
    }
}
