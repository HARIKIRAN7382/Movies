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
        upcomingRefreshControl?.addTarget(self, action: #selector(reloadUpcomingData), for: .valueChanged)
    }
    
    @objc func reloadUpcomingData(){
        homeViewDelegate?.getUpcomingMoviesList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getUpComingMovieData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingMoviesTableViewCell.UPCOMING_MOVIES_TABLEVIEW_CELL_IDENTIFIER, for: indexPath) as! UpcomingMoviesTableViewCell
        if let image = getUpComingMovieData?.results?[indexPath.row].image{
            cell.upcomingMovieImageView.image = image
        }else{
            ImageCacheLoader().obtainImageWithPath(imagePath: AppConstants.imageLoadURL + (getUpComingMovieData?.results?[indexPath.row].posterPath ?? "")) { (image) in
                cell.upcomingMovieImageView.image = image
                self.getUpComingMovieData?.results?[indexPath.row].image = image
            }
        }
        cell.upcomingMovieNameLabel.text = getUpComingMovieData?.results?[indexPath.row].originalTitle
        cell.upcomingMovieReleseDateLabel.text = getUpComingMovieData?.results?[indexPath.row].releaseDate
        if let likeCount =  getUpComingMovieData?.results?[indexPath.row].voteCount {
            cell.upcomingMovieRatingLabel.text =  likeCount.formatUsingAbbrevation()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = (storyboard?.instantiateViewController(identifier: AppIdentifiers.MOVIE_DETATILS_VC_IDENTIFIER))! as MovieDetailsViewController
        movieDetailsVC.selectionType = .upcoming
        movieDetailsVC.selectedUpcomingMovie = getUpComingMovieData?.results?[indexPath.row]
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    func reloadUpComingMoviesList(){
        DispatchQueue.main.async {
            self.upcomingMoviesTableView.reloadData()
        }
    }
    
}
