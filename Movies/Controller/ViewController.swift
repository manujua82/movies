//
//  ViewController.swift
//  Movies
//
//  Created by Juan Salcedo on 2/5/18.
//  Copyright © 2018 Juan Salcedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world");
        
        
        TMDBClient.sharedInstance().getDiscoverMovies { (discover, error, eMessage) in
            if let _ = error{
                DispatchQueue.main.async {
                    print("ShowAlert")
                }
            }else{
                print(discover!)
            }
        }
    }

    


}

