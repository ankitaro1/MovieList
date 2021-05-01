//
//  MovieDetailViewController.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import UIKit

open class MovieDetailViewController: UIViewController {

    @IBOutlet public var imageView: UIImageView?
    
    
    @IBOutlet public var titleLabel: UILabel?
    
    @IBOutlet public var rating: UILabel?
    
    @IBOutlet public var releaseDate: UILabel?
    
    @IBOutlet public var adultLabel: UILabel?
    
    @IBOutlet public var overViewLabel: UILabel?
    
    
    public var data: MovieDetails?
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = Constants.titleString + (data?.title ?? "")
        self.rating?.text = Constants.ratingString + (data?.rating ?? "")
        self.releaseDate?.text = Constants.releaseDateString + (data?.releaseDate ?? "")
        if self.data?.isAdult ?? false {
            self.adultLabel?.text = Constants.forAdultString
        } else {
            self.adultLabel?.text = ""
        }
        self.overViewLabel?.text = data?.description ?? ""
        
    }


    

}
