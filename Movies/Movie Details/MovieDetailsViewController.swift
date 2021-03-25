//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by iOS Developer on 22/03/21.
//

import UIKit

enum SelectionType {
    case upcoming
    case toprated
}

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releseDateLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var selectionType:SelectionType?
    
    var selectedTopRatedMovie:GetTopRatedMovieResult?
    var selectedUpcomingMovie:GetUpcomingMovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectionType == SelectionType.upcoming){
            self.title = selectedUpcomingMovie?.originalTitle ?? ""
            movieImageView.image = selectedUpcomingMovie?.image
            movieNameLabel.text = "\(selectedUpcomingMovie?.originalTitle ?? "")(\(selectedUpcomingMovie?.originalLanguage ?? ""))"
            releseDateLabel.text = selectedUpcomingMovie?.releaseDate ?? ""
            overviewLabel.text = selectedUpcomingMovie?.overview
            likeImageView.image = #imageLiteral(resourceName: "like")
            if let likeCount = selectedUpcomingMovie?.voteCount {
                likesLabel.text = likeCount.formatUsingAbbrevation()
            }
        }else{
            self.title = selectedTopRatedMovie?.originalTitle ?? ""
            movieImageView.image = selectedTopRatedMovie?.image
            movieNameLabel.text = "\(selectedTopRatedMovie?.originalTitle ?? "")(\(selectedTopRatedMovie?.originalLanguage ?? ""))"
            releseDateLabel.text = selectedTopRatedMovie?.releaseDate ?? ""
            overviewLabel.text = selectedTopRatedMovie?.overview
            likeImageView.image = #imageLiteral(resourceName: "heart")
            if let likeCount = selectedTopRatedMovie?.voteCount,let popularity = selectedTopRatedMovie?.voteAverage {
                likesLabel.text = "\(Int(popularity * 10))%  \(likeCount.formatUsingAbbrevation())"
            }
        }
        
    }
    
}
