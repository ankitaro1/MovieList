//
//  MovieListDataSource.swift
//  iOS_Movie_App_Core
//
//  Created by Ankit sharma7 on 01/05/21.
//

import Foundation


class MovieListDataSource {
    
    func parseJson() -> [MovieListResponseDao]? {
        var movieResponseObj: [MovieListResponseDao]?
        var jsonData: Data?
        do {
            let bundle = Constants.sdkBundle
            let path = bundle.path(forResource: Constants.jsonFileName, ofType: "json")
            jsonData = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            if jsonData != nil {
                let decoder = JSONDecoder()
                movieResponseObj = try decoder.decode([MovieListResponseDao].self, from: jsonData ?? Data())
            }
            return movieResponseObj
        } catch {
            return nil
        }
    }
}
