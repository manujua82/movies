//
//  TMDBConvenience.swift
//  Movies
//
//  Created by Juan Salcedo on 2/5/18.
//  Copyright © 2018 Juan Salcedo. All rights reserved.
//

import Foundation

extension TMDBClient {
    func getDiscoverMovies(_ completionHandlerForGetDiscoverMovies: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void) {
        
        let parameters = [TMDBClient.ParameterKeys.ApiKey: TMDBClient.Constants.APIKey,
                          TMDBClient.ParameterKeys.Language: "en-US",
                          TMDBClient.ParameterKeys.SortBy: "popularity.desc",
                          TMDBClient.ParameterKeys.IncludeAdult: false,
                          TMDBClient.ParameterKeys.IncludeVideo: false,
                          TMDBClient.ParameterKeys.Page: 1] as [String : AnyObject]
        
        getLists(parameters: parameters, method: TMDBClient.Methods.DiscoveryMovie, completionHandlerForGetDiscoverMovies)
    }
    
    
    
    func getUpcomingMovies(_ completionHandlerForGetUpcomingMovies: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void){
        
        let parameters = [TMDBClient.ParameterKeys.ApiKey: TMDBClient.Constants.APIKey,
                          TMDBClient.ParameterKeys.Language: "en-US",
                          TMDBClient.ParameterKeys.Region: "US",
                          TMDBClient.ParameterKeys.Page: 1] as [String : AnyObject]
    
        getLists(parameters: parameters, method: TMDBClient.Methods.MovieUpcoming, completionHandlerForGetUpcomingMovies)
    }
    
    func getTopRatedMovie(_ completionHandlerForGetTopRated: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void){
        let parameters = [TMDBClient.ParameterKeys.ApiKey: TMDBClient.Constants.APIKey,
                          TMDBClient.ParameterKeys.Language: "en-US",
                          TMDBClient.ParameterKeys.Region: "US",
                          TMDBClient.ParameterKeys.Page: 1] as [String : AnyObject]
        
        getLists(parameters: parameters, method: TMDBClient.Methods.MovieTopRated, completionHandlerForGetTopRated)
    }
    
    func getPopularMovie(_ completionHandlerForGetPopular: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void){
        let parameters = [TMDBClient.ParameterKeys.ApiKey: TMDBClient.Constants.APIKey,
                          TMDBClient.ParameterKeys.Language: "en-US",
                          TMDBClient.ParameterKeys.Region: "US",
                          TMDBClient.ParameterKeys.Page: 1] as [String : AnyObject]
        
        getLists(parameters: parameters, method: TMDBClient.Methods.MoviePopular, completionHandlerForGetPopular)
    }
    
    func getNowPlayingMovie(_ completionHandlerForNowPlaying: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void){
        let parameters = [TMDBClient.ParameterKeys.ApiKey: TMDBClient.Constants.APIKey,
                          TMDBClient.ParameterKeys.Language: "en-US",
                          TMDBClient.ParameterKeys.Region: "US",
                          TMDBClient.ParameterKeys.Page: 1] as [String : AnyObject]
        
        getLists(parameters: parameters, method: TMDBClient.Methods.MovieNowPlaying, completionHandlerForNowPlaying)
    }
    
    
    func getLists(parameters: [String : AnyObject], method: String, _ completionHandlerForGetList: @escaping (_ result: [Discover]?, _ error: NSError?, _ errorMessage: String?) -> Void ){
        
        let _ = taskForGETMethod(method: method, parameters: parameters) { (results, error, errorMessage) in
            if let error = error{
                print(error)
                completionHandlerForGetList(nil,error, errorMessage)
            }else{
                if let results = results?[TMDBClient.JSONResponseKeys.Results] as? [[String:AnyObject]]{
                    let discover = Discover.discoveriesFromResults(results)
                    completionHandlerForGetList(discover,nil,nil)
                }else {
                    completionHandlerForGetList(nil, NSError(domain: "\(method)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not TMDB get \(method)"]), "Could not TMDB get \(method)")
                }
            }
        }
    }
    
    // MARK: Utilitiess
    static func downloadImage( imagePath:String, completionHandler: @escaping (_ imageData: Data?, _ errorString: String?) -> Void){
        
        let session = URLSession.shared
        let imgURL = NSURL(string: imagePath)
        let request: NSURLRequest = NSURLRequest(url: imgURL! as URL)
        
        let task = session.dataTask(with: request as URLRequest) {data, response, downloadError in
            
            if downloadError != nil {
                completionHandler(nil, "Could not download image \(imagePath)")
            } else {
                
                completionHandler(data, nil)
            }
        }
        
        task.resume()
    }
}
