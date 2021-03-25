//
//  TopRatingTableViewCell.swift
//  Movies
//
//  Created by iOS Developer on 25/03/21.
//

import UIKit

class TopRatingTableViewCell: UITableViewCell {
    static let TOP_RATING_MOVIES_TABLEVIEW_CELL_IDENTIFIER = "TopRatingMoviesTableViewCell"
    
    @IBOutlet weak var topRatingMovieImageView: UIImageView!
    @IBOutlet weak var topRatingMovieNameLabel: UILabel!
    @IBOutlet weak var topRatingMovieReleseDateLabel: UILabel!
    @IBOutlet weak var topRatingMovieRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
