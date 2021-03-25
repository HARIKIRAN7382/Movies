//
//  HomeViewModel.swift
//  Movies
//
//  Created by iOS Developer on 23/03/21.
//

import Foundation

class HomeViewModel{
    let provider = ServiceProvider()
    
    weak var homeViewDelegate:HomeViewDelegate?
    
    var getUpComingMovieData:GetUpcomingMovieData?
    var getTopRatedMovieData:GetTopRatedMovieData?
    
    func getUpComingMoviesList(){
        provider.getUpcomingMoviesList { (getUpcomingMovieData) in
            self.getUpComingMovieData = getUpcomingMovieData
            self.homeViewDelegate?.onSuccessUpComingMovies()
        } failureBlock: { reason  in
            self.homeViewDelegate?.onFailure(reason: reason)
        }
    }
    
    func getTopRatedMoviesList(){
        provider.getTopRatedMoviesList { (getTopRatedMovieData) in
            self.getTopRatedMovieData = getTopRatedMovieData
            self.homeViewDelegate?.onSuccessGetTopRatedMovies()
        } failureBlock: { reason in
            self.homeViewDelegate?.onFailure(reason: reason)
        }
    }
    
}
