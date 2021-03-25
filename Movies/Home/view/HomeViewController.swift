//
//  ViewController.swift
//  Movies
//
//  Created by iOS Developer on 22/03/21.
//

import UIKit

protocol HomeViewDelegate:class{
    func onSuccessGetTopRatedMovies()
    func onSuccessUpComingMovies()
    func onFailure(reason:String)
}

protocol HomeViewControllerDelegate:class{
    func getTopRatedMoviesList()
    func getUpcomingMoviesList()
}

class HomeViewController: BaseViewController, HomeViewDelegate,HomeViewControllerDelegate {
    
    let homeVM = HomeViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.homeViewDelegate = self
        getTopRatedMoviesList()
        getUpcomingMoviesList()
        (self.viewControllers?.last as! TopRatedMoviesViewController).homeViewControllerDelegate = self
        (self.viewControllers?.first as! UpcomingMoviesViewController).homeViewDelegate = self
    }
    
    func getTopRatedMoviesList() {
        showActivityIndicator(show: true)
        homeVM.getTopRatedMoviesList()
    }
    
    func getUpcomingMoviesList() {
        showActivityIndicator(show: true)
        homeVM.getUpComingMoviesList()
    }
    
    
    func onSuccessGetTopRatedMovies() {
        DispatchQueue.main.async {
            self.showActivityIndicator(show: false)
            let topRatedMoviesVC = self.viewControllers?.last as! TopRatedMoviesViewController
            topRatedMoviesVC.getTopRatedMovieData = self.homeVM.getTopRatedMovieData
            topRatedMoviesVC.topRatingRefreshControl?.endRefreshing()
        }
    }
    
    func onSuccessUpComingMovies() {
        DispatchQueue.main.async {
            self.showActivityIndicator(show: false)
            let upcomingMoviesVC = self.viewControllers?.first as! UpcomingMoviesViewController
            upcomingMoviesVC.getUpComingMovieData = self.homeVM.getUpComingMovieData
            upcomingMoviesVC.reloadUpComingMoviesList()
            upcomingMoviesVC.upcomingRefreshControl?.endRefreshing()
        }
    }
    
    func onFailure(reason: String) {
        DispatchQueue.main.async {
            self.showActivityIndicator(show: false)
            let alert = UIAlertController(title: "Error", message: reason, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

