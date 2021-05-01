//
//  MovieListCell.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import UIKit

open class MovieListCell: UITableViewCell {

    @IBOutlet public var titleLabel: UILabel?
    
    @IBOutlet public var releaseDateLabel: UILabel?
    
    @IBOutlet public var movieImageViewer: UIImageView?
    
    var data: MovieDetails?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData() {
        self.titleLabel?.text =  Constants.titleString + (data?.title ?? "")
        self.releaseDateLabel?.text = Constants.releaseDateString + (data?.releaseDate ?? "")
        self.downloadImage(from: URL(string: (Constants.baseUrl + (data?.imageUrl ?? "")))!)
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.movieImageViewer?.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }


   
}
