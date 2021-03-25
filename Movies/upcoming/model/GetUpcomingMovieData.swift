//
//  GetUpcomingMovieData.swift
//  Movies
//
//  Created by iOS Developer on 23/03/21.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getUpcomingMovieData = try? newJSONDecoder().decode(GetUpcomingMovieData.self, from: jsonData)

import Foundation
import UIKit

// MARK: - GetUpcomingMovieData
class GetUpcomingMovieData: Codable {
    let dates: Dates?
    let page: Int?
    let results: [GetUpcomingMovieResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(dates: Dates?, page: Int?, results: [GetUpcomingMovieResult]?, totalPages: Int?, totalResults: Int?) {
        self.dates = dates
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

// MARK: - Dates
class Dates: Codable {
    let maximum, minimum: String?
    
    init(maximum: String?, minimum: String?) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

// MARK: - Result
class GetUpcomingMovieResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    var image:UIImage?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(adult: Bool?, backdropPath: String?, genreIDS: [Int]?, id: Int?, originalLanguage: String?, originalTitle: String?, overview: String?, popularity: Double?, posterPath: String?, releaseDate: String?, title: String?, video: Bool?, voteAverage: Double?, voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
