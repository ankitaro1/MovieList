//
//  MovieListUIModel.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import Foundation



public struct MovieListUIModel {
    public let list: [MovieDetails]
}


public struct MovieDetails {
    public let isAdult: Bool
    public let title: String
    public let description: String
    public let rating: String
    public let imageUrl: String
    public let releaseDate: String
    public let movieLanguage: String
}
