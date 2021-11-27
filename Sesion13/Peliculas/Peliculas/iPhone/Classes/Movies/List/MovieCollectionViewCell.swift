//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 5/11/21.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    func updateData(_ objMovie: Movie) {
        
        self.animateAppear()
        self.lblTitle.text = objMovie.name
        
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
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        let randomDelay = CGFloat.random(in: 0...(0.6))
        
        UIView.animate(withDuration: 0.5, delay: randomDelay, options: [.curveEaseInOut], animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}

extension MovieCollectionViewCell {
    
    class func createInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, objMovie: Movie) -> UICollectionViewCell {

        let cellIdentifier = "MovieCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieCollectionViewCell
        cell?.updateData(objMovie)
        return cell ?? MovieCollectionViewCell()
    }
}
