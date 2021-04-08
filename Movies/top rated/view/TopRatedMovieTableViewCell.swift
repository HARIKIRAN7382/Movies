//
//  TopRatedMovieTableViewCell.swift
//  Movies
//
//  Created by iOS Developer on 08/04/21.
//

import UIKit
import MaterialComponents.MaterialCards
import SwiftUI


class TopRatedMovieTableViewCell: UITableViewCell {
    static let identifier = "TopRatedMovieTableViewCell"
    
    lazy var cardView:MDCCard = {
        let card = MDCCard(frame: .zero)
        return card
    }()
    
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    lazy var movieDetailsStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.isUserInteractionEnabled = false
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var movieNameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        return label
    }()
    
    
    lazy var movieDateAndRatingStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    lazy var movieReleseDateLabel:UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = false
        label.textColor = .gray
        return label
    }()
    
    lazy var movieRatingStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2.5
        stackView.isUserInteractionEnabled = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var moviewRatingSymbolImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "heart")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    lazy var movieRatingLabel:UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = false
        label.textColor = .gray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configCardView()
        configMovieImageView()
        configMovieRatingStackView()
        configMovieReleseDataAndRatingStackView()
        configMovieDetails()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    
    //MARK:- Config Card View
    func configCardView(){
        contentView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    //MARK:- Config Movie Image View
    func configMovieImageView(){
        cardView.addSubview(movieImageView)
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 5
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(greaterThanOrEqualTo: cardView.topAnchor, constant: 0),
            movieImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
            movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: 0),
            movieImageView.heightAnchor.constraint(equalToConstant: 60),
            movieImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK:- Config Movie Image View
    func configMovieDetails(){
        cardView.addSubview(movieDetailsStackView)
        movieDetailsStackView.addArrangedSubview(movieNameLabel)
        movieDetailsStackView.addArrangedSubview(movieDateAndRatingStackView)
        movieDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieDetailsStackView.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 2.5),
            movieDetailsStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 5),
            movieDetailsStackView.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor, constant: -5),
            movieDetailsStackView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -5)
        ])
    }
    
    
    //MARK:- Config Movie relese date and rating stack view
    func configMovieReleseDataAndRatingStackView(){
        cardView.addSubview(movieDateAndRatingStackView)
        movieDateAndRatingStackView.addArrangedSubview(movieReleseDateLabel)
        movieDateAndRatingStackView.addArrangedSubview(movieRatingStackView)
        movieReleseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieReleseDateLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.45)
        ])
    }
  
    //MARK:- Config Movie Rating Stack View
    func configMovieRatingStackView(){
        cardView.addSubview(movieRatingStackView)
        movieRatingStackView.addArrangedSubview(moviewRatingSymbolImage)
        movieRatingStackView.addArrangedSubview(movieRatingLabel)
        moviewRatingSymbolImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviewRatingSymbolImage.heightAnchor.constraint(equalToConstant: 25),
            moviewRatingSymbolImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }

        
}



