//
//  UpcomingMoviesTableViewCell.swift
//  Movies
//
//  Created by iOS Developer on 25/03/21.
//

import UIKit

class UpcomingMoviesTableViewCell: UITableViewCell {
    
    static let UPCOMING_MOVIES_TABLEVIEW_CELL_IDENTIFIER = "UpcomingMoviesTableViewCell"
    
    @IBOutlet weak var upcomingMovieImageView: UIImageView!
    @IBOutlet weak var upcomingMovieNameLabel: UILabel!
    @IBOutlet weak var upcomingMovieReleseDateLabel: UILabel!
    @IBOutlet weak var upcomingMovieRatingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
