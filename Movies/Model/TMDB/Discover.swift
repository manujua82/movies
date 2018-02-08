//
//  Discover.swift
//  Movies
//
//  Created by Juan Salcedo on 2/5/18.
//  Copyright © 2018 Juan Salcedo. All rights reserved.
//

import Foundation

struct Discover {
    var id: Int?
    var video: Bool?
    var title: String?
    var adult: Bool?
    var popularity: Double?
    //var genreIds     = "genre_ids"
    var voteCount: Int?
    var voteAverage: Double?
    var posterPath: String?
    var backdropPath: String?
    var overview: String?
    var releaseDate: String?
    var originalLanguage: String?
    var originalTitle: String?
    
    init(){
        self.id = 0
        self.video = false
        self.title = ""
        self.adult = false
        self.popularity = 0.0
        //self.genreIds     = "genre_ids"
        self.voteCount = 0
        self.voteAverage = 0.0
        self.posterPath = ""
        self.backdropPath = ""
        self.overview = ""
        self.releaseDate = ""
        self.originalLanguage = ""
        self.originalTitle = ""
    }
    
    // Construct a Discovery from a dictionary
    init(dictionary: [String:AnyObject]) {
        
        self.id = dictionary[TMDBClient.JSONResponseKeys.Id] as? Int
        
        if let video = dictionary[TMDBClient.JSONResponseKeys.Video] as? Bool{
            self.video = video
        }else{
            self.video = false
        }
        
        if let title = dictionary[TMDBClient.JSONResponseKeys.Title] as? String{
            self.title = title
        }else{
            self.title = ""
        }
        
        if let adult = dictionary[TMDBClient.JSONResponseKeys.Adult] as? Bool{
            self.adult = adult
        }else{
            self.adult = false
        }
        
        if let popularity = dictionary[TMDBClient.JSONResponseKeys.Popularity] as? Double {
            self.popularity = popularity
        }else{
            popularity = 0.0
        }
        
        if let voteCount = dictionary[TMDBClient.JSONResponseKeys.VoteCount] as? Int {
            self.voteCount = voteCount
        }else{
            self.voteCount = 0
        }
        
        if let voteAverage = dictionary[TMDBClient.JSONResponseKeys.VoteAverage] as? Double{
            self.voteAverage = voteAverage
        }else{
            self.voteAverage = 0.0
        }
        
        if let posterPath = dictionary[TMDBClient.JSONResponseKeys.PosterPath] as? String{
            self.posterPath = posterPath
        }else{
            self.posterPath = ""
        }
        
        if let backdropPath = dictionary[TMDBClient.JSONResponseKeys.BackdropPath] as? String{
            self.backdropPath = backdropPath
        }else{
            self.backdropPath = ""
        }
        
        if let overview = dictionary[TMDBClient.JSONResponseKeys.Overview] as? String{
            self.overview = overview
        }else{
            self.overview = ""
        }
        
        if let releaseDate = dictionary[TMDBClient.JSONResponseKeys.ReleaseDate] as? String{
            self.releaseDate = releaseDate
        }else{
            self.releaseDate = ""
        }
        
        if let originalLanguage = dictionary[TMDBClient.JSONResponseKeys.OriginalLanguage] as? String{
            self.originalLanguage =  originalLanguage
        }else{
            self.originalLanguage = ""
        }
        
        if let originalTitle = dictionary[TMDBClient.JSONResponseKeys.OriginalTitle] as? String {
            self.originalTitle = originalTitle
        }else{
            self.originalTitle = ""
        }
    }
    
    static func discoveriesFromResults(_ results: [[String:AnyObject]]) -> [Discover]{
        var discover = [Discover]()
        
        for result in results {
            discover.append(Discover(dictionary: result))
        }
        
        return discover
    }
    
}
