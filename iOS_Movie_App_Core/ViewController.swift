//
//  ViewController.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import UIKit

open class ViewController: UIViewController , MovieListFlowDelegate, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet public var movieTableView: UITableView?
    
    public var viewModel: MovieListViewModel?
    
    public var data: MovieListUIModel?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieListViewModel(delegate: self)
        self.viewModel?.performJsonParsingAction()
        movieTableView?.delegate = self
        movieTableView?.dataSource = self
        self.movieTableView?.register(UINib.init(nibName: "MovieListCell", bundle: Constants.sdkBundle), forCellReuseIdentifier: "MovieListCell")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data?.list.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieTableView?.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as? MovieListCell
        cell?.data = self.data?.list[indexPath.row]
        cell?.setData()
        return cell ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    
    func setCuisinesDetails(data: MovieListUIModel) {
        self.data = data
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetVC = MovieDetailViewController()
        targetVC.data = self.data?.list[indexPath.row]
        let cell = self.movieTableView?.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as? MovieListCell
        targetVC.imageView?.image = cell?.movieImageViewer?.image
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

}

