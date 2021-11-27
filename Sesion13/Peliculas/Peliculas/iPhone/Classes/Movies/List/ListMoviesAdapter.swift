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
    
    func setCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ListMoviesAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        MovieCollectionViewCell.createInCollectionView(collectionView, indexPath: indexPath, objMovie: self.arrayMovies[indexPath.row])
    }
}

extension ListMoviesAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objMovie = self.arrayMovies[indexPath.row]
        self.controller.goToMovieDetail(objMovie)
    }
}

extension ListMoviesAdapter: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let numberOfColumns: CGFloat = 3
//        let collectionWidth = collectionView.frame.width
//
//        let totalSpacingColums: CGFloat = (numberOfColumns - 1) * 10
//        let totalInsets: CGFloat = 20
//
//        let availableTotalSpace = collectionWidth - totalSpacingColums - totalInsets
//        let cellWidth = (availableTotalSpace / numberOfColumns).rounded(.down)
//        let cellHeight = cellWidth * (220/130)
//
//        let newSize = CGSize(width: cellWidth, height: cellHeight)
//        return newSize
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfColumns: CGFloat = 3
        let collectionWidth = collectionView.frame.width
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout

        let collectionInsets = layout?.sectionInset ?? .zero
        let totalSpacingColums = (numberOfColumns - 1) * (layout?.minimumInteritemSpacing ?? 0)
        let totalInsets = collectionInsets.left + collectionInsets.right

        let availableTotalSpace = collectionWidth - totalSpacingColums - totalInsets
        let cellWidth = (availableTotalSpace / numberOfColumns).rounded(.down)
        let cellHeight = cellWidth * (230/130)

        let newSize = CGSize(width: cellWidth, height: cellHeight)
        return newSize
    }
}
