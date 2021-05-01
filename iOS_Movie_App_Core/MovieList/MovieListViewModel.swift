//
//  MovieListViewModel.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import Foundation


 protocol MovieListFlowDelegate{
    func setCuisinesDetails(data : MovieListUIModel)
}

public class MovieListViewModel {
    var dataSource: MovieListDataSource
    var delegate: MovieListFlowDelegate?
    
    init(delegate: MovieListFlowDelegate){
        self.delegate = delegate
        self.dataSource = MovieListDataSource()
    }
    
    public func performJsonParsingAction(){
       let reponseObj =  self.dataSource.parseJson()
        var data: MovieListUIModel?
        var list: [MovieDetails] = []
        for item in reponseObj!{
            list.append(MovieDetails(isAdult: item.adult, title: item.title, description: item.overView, rating: String(item.voteAverage) , imageUrl: item.posterPath, releaseDate: item.releaseDate, movieLanguage: item.originalLanguage))
        }
        data = MovieListUIModel(list: list)
        self.delegate?.setCuisinesDetails(data: data ?? MovieListUIModel(list: []))
    }
}
