//
//  TMDBConstants.swift
//  Movies
//
//  Created by Juan Salcedo on 2/5/18.
//  Copyright © 2018 Juan Salcedo. All rights reserved.
//

import Foundation

extension TMDBClient{
    
    // MARK: TMDB
    struct Constants {
        static let APIKey = "6a879c15b291d72fbf1774f9f0f773bb"
        static let BaseUrl = "https://api.themoviedb.org/3"
    }
    
    // MARK: Methods
    struct Methods {
        static let DiscoveryMovie   = "/discover/movie"
        
        static let MovieUpcoming    = "/movie/upcoming"
        static let MovieTopRated    = "/movie/top_rated"
        static let MoviePopular     = "/movie/popular"
        static let MovieNowPlaying  = "/movie/now_playing"
    }
    
    // MARK: ParameterKeys
    struct ParameterKeys {
        static let ApiKey       = "api_key"
        static let Language     = "language"
        static let SortBy       = "sort_by"
        static let Page         = "page"
        static let Region       = "region"
        static let IncludeAdult = "include_adult"
        static let IncludeVideo = "include_video"
    
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        static let Page         = "page"
        static let Results      = "results"
        static let Dates        = "dates"
        static let TotalResults = "total_results"
        static let TotalPages   = "total_pages"
        
        static let Id           = "id"
        static let Video        = "video"
        static let Title        = "title"
        static let Adult        = "adult"
        static let Popularity   = "popularity"
        static let GenreIds     = "genre_ids"
        static let VoteCount    = "vote_count"
        static let VoteAverage  = "vote_average"
        static let PosterPath   = "poster_path"
        static let BackdropPath = "backdrop_path"
        static let Overview     = "overview"
        static let ReleaseDate  = "release_date"
        static let OriginalLanguage = "original_language"
        static let OriginalTitle = "original_title"
    }
}
