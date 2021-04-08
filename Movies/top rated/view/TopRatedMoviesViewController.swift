//
//  TopRatedMoviesViewController.swift
//  Movies
//
//  Created by iOS Developer on 22/03/21.
//

import UIKit

class TopRatedMoviesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var topRatedTableView: UITableView!
    
    var getTopRatedMovieData:GetTopRatedMovieData?
    
    var topRatingRefreshControl:UIRefreshControl?
    weak var homeViewControllerDelegate:HomeViewControllerDelegate?
    
    
    override func viewDidAppear(_ animated: Bool) {
        topRatedTableView.reloadData()
        self.tabBarController?.title = "Top Rated"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topRatedTableView.register(TopRatedMovieTableViewCell.self, forCellReuseIdentifier: TopRatedMovieTableViewCell.identifier)
        topRatingRefreshControl = UIRefreshControl()
        topRatingRefreshControl?.tintColor = .systemBlue
        topRatedTableView.addSubview(topRatingRefreshControl ?? UIRefreshControl())
        topRatingRefreshControl?.addTarget(self, action: #selector(reloadTopRatingData), for: .valueChanged)
    }
    
    @objc func reloadTopRatingData(){
        homeViewControllerDelegate?.getTopRatedMoviesList()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTopRatedMovieData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedMovieTableViewCell.identifier, for: indexPath) as! TopRatedMovieTableViewCell
        if let image = getTopRatedMovieData?.results?[indexPath.row].image{
            cell.movieImageView.image = image
        }else{
            ImageCacheLoader().obtainImageWithPath(imagePath: AppConstants.imageLoadURL + (self.getTopRatedMovieData?.results?[indexPath.row].posterPath ?? "")) { (image) in
                cell.movieImageView.image = image
                self.getTopRatedMovieData?.results?[indexPath.row].image = image
            }
        }
        cell.movieNameLabel.text = getTopRatedMovieData?.results?[indexPath.row].originalTitle
        cell.movieReleseDateLabel.text = getTopRatedMovieData?.results?[indexPath.row].releaseDate
        if let likeCount = getTopRatedMovieData?.results?[indexPath.row].voteCount,let popularity = getTopRatedMovieData?.results?[indexPath.row].voteAverage {
            cell.movieRatingLabel.text = "\(Int(popularity * 10))%  \(likeCount.formatUsingAbbrevation())"
        }
        cell.moviewRatingSymbolImage.image = #imageLiteral(resourceName: "heart")
        cell.cardView.tag = indexPath.row
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapedOnCardView(_:)))
        cell.cardView.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func onTapedOnCardView(_ sender:UITapGestureRecognizer){
        self.topRatedTableView.isUserInteractionEnabled = false
        DispatchQueue.main.async {
            self.tableView(self.topRatedTableView, didSelectRowAt: IndexPath(row: sender.view?.tag ?? 0, section: 0))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = (storyboard?.instantiateViewController(identifier: "MovieDetailsViewController"))! as MovieDetailsViewController
        movieDetailsVC.selectedTopRatedMovie = self.getTopRatedMovieData?.results?[indexPath.row]
        movieDetailsVC.selectionType = .toprated
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        self.topRatedTableView.isUserInteractionEnabled = true
    }
    
}
