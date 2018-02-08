//
//  DiscoverTableViewController.swift
//  Movies
//
//  Created by Juan Salcedo on 2/5/18.
//  Copyright © 2018 Juan Salcedo. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UITableViewController {
    var discover = [Discover]()
    @IBOutlet var discoverTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DownloadMovie()
    }

 
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discover.count
    }
    
    
    // Set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        let movieForRow = self.discover[(indexPath as NSIndexPath).row]
        
        cell.titleLabel?.text = movieForRow.originalTitle
        if var urlStr = movieForRow.backdropPath{
            urlStr = "https://image.tmdb.org/t/p/w780\(urlStr)"
            
            TMDBClient.downloadImage(imagePath: urlStr, completionHandler: { (data, error) in
                if let error = error{
                    print("Somthing is wrong with download:  \(error.description)")
                }else{
                    DispatchQueue.main.async {
                        cell.backdropImageView.image = UIImage(data: data!)
                    }
                }
            })

        }
        return cell;
    }
    
    func loadTable(){
        if self.discover.count > 0{
           self.discoverTable.reloadData()
        }
    }

    func DownloadMovie(){
        TMDBClient.sharedInstance().getNowPlayingMovie { (discover, error, message) in
            if let _ = error{
                print("error")
            }else{
                self.discover = discover!
                DispatchQueue.main.async {
                    self.loadTable()
                }
            }
        }
        
       /*TMDBClient.sharedInstance().getDiscoverMovies { (discover, error, message) in
            if let _ = error{
                print("error")
            }else{
                self.discover = discover!
                DispatchQueue.main.async {
                    self.loadTable()
                }
            }
        }*/
    }
}
