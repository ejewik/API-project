//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator


class ViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
   // func randomInt (upper: Int) -> Int {
   //     let randInt: Int = Int(arc4random_uniform(UInt32(upper)))
   //     return randInt
   // }
    
    //var randMovie : Movie
    
    //print(“My random number is \(randomInt(upper: 100))“)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //exerciseOne()
        //exerciseTwo()
        //exerciseThree()
       
        
        
        let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let allMoviesData = json["feed"]["entry"].arrayValue
                    var randMovies: [Movie] = []
                    
                    for movie in allMoviesData {
                        randMovies.append(Movie( json: movie))
                    }
                
                    let randMovie : Movie = randMovies[Int(arc4random_uniform(UInt32(randMovies.count)))]
                    
                     print("The top movie is \(randMovie.name) by \(randMovie.rightsOwner). It costs $\(randMovie.price) and was released on \(randMovie.releaseDate). You can view it on iTunes here: \(randMovie.link)")
                    self.loadPoster(urlString: randMovie.poster)
                }
                
               
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                   // guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
                    //    print("Could not find iTunes-Movies.json!")
                    //    return
                    //}
                
                
                
              
                   
                
                    
                   // let movie : Movie = movieList[randNum]
                    
                //    print("\(movie.name) and \(movie.releaseDate)")
                    
                
            case .failure(let error):
                print(error)
         
    }
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    @IBAction func viewOniTunesPressed(_ sender: AnyObject) {
       // UIApplication.shared.openURL(URL(string: randMovie.link)!)
    }
    
}


