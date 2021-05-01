//
//  MovieListResponseDao.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import Foundation


class MovieListResponseDao: Decodable {
    let title: String
    let releaseDate: String
    let voteAverage: Float
    let adult: Bool
    let posterPath: String
    let overView: String
    let originalLanguage: String
    
        
        enum CodingKeys: String, CodingKey {
          case title
          case releaseDate = "release_date"
          case voteAverage = "vote_average"
          case adult
          case posterPath = "poster_path"
          case overView = "overview"
          case originalLanguage = "original_language"
        }
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String.self, forKey: .title)
            self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
            self.voteAverage = try container.decode(Float.self, forKey: .voteAverage)
            self.adult = try container.decode(Bool.self, forKey: .adult)
            self.posterPath = try container.decode(String.self, forKey: .posterPath)
            self.overView = try container.decode(String.self, forKey: .overView)
            self.originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
           }
}
