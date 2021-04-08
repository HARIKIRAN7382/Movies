//
//  UpcomingViewController.swift
//  Movies
//
//  Created by iOS Developer on 22/03/21.
//

import UIKit

class UpcomingMoviesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var upcomingMoviesTableView: UITableView!
    
    var getUpComingMovieData:GetUpcomingMovieData?
    
    var upcomingRefreshControl:UIRefreshControl?
    weak var homeViewDelegate:HomeViewControllerDelegate?
    
    override func viewDidAppear(_ animated: Bool) {
        upcomingMoviesTableView.reloadData()
        self.tabBarController?.title = "Upcoming"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = "Upcoming"
        upcomingRefreshControl = UIRefreshControl()
        upcomingRefreshControl?.tintColor = .systemBlue
        upcomingMoviesTableView.addSubview(upcomingRefreshControl ?? UIRefreshControl())
        upcomingMoviesTableView.register(TopRatedMovieTableViewCell.self, forCellReuseIdentifier: TopRatedMovieTableViewCell.identifier)
        upcomingRefreshControl?.addTarget(self, action: #selector(reloadUpcomingData), for: .valueChanged)
    }
    
    @objc func reloadUpcomingData(){
        homeViewDelegate?.getUpcomingMoviesList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getUpComingMovieData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedMovieTableViewCell.identifier, for: indexPath) as! TopRatedMovieTableViewCell
        if let image = getUpComingMovieData?.results?[indexPath.row].image{
            cell.movieImageView.image = image
        }else{
            ImageCacheLoader().obtainImageWithPath(imagePath: AppConstants.imageLoadURL + (getUpComingMovieData?.results?[indexPath.row].posterPath ?? "")) { (image) in
                cell.movieImageView.image = image
                self.getUpComingMovieData?.results?[indexPath.row].image = image
            }
        }
        cell.movieNameLabel.text = getUpComingMovieData?.results?[indexPath.row].originalTitle
        cell.movieReleseDateLabel.text = getUpComingMovieData?.results?[indexPath.row].releaseDate
        if let likeCount =  getUpComingMovieData?.results?[indexPath.row].voteCount {
            cell.movieRatingLabel.text =  likeCount.formatUsingAbbrevation()
        }
        cell.moviewRatingSymbolImage.image = #imageLiteral(resourceName: "like")
        cell.cardView.tag = indexPath.row
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapedOnCardView(_:)))
        cell.cardView.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func onTapedOnCardView(_ sender:UITapGestureRecognizer){
        self.upcomingMoviesTableView.isUserInteractionEnabled = false
        DispatchQueue.main.async {
            self.tableView(self.upcomingMoviesTableView, didSelectRowAt: IndexPath(row: sender.view?.tag ?? 0, section: 0))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = (storyboard?.instantiateViewController(identifier: AppIdentifiers.MOVIE_DETATILS_VC_IDENTIFIER))! as MovieDetailsViewController
        movieDetailsVC.selectionType = .upcoming
        movieDetailsVC.selectedUpcomingMovie = getUpComingMovieData?.results?[indexPath.row]
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
        self.upcomingMoviesTableView.isUserInteractionEnabled = true
    }
    
    func reloadUpComingMoviesList(){
        DispatchQueue.main.async {
            self.upcomingMoviesTableView.reloadData()
        }
    }
    
}
