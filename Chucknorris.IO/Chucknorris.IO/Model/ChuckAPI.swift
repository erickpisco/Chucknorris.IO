//
//  ChuckAPI.swift
//  Chucknorris.IO
//
//  Created by erick pisco on 11/30/18.
//  Copyright © 2018 erick pisco. All rights reserved.
//

import Foundation
import Alamofire

class ChuckAPI  {
    
    static private let basePath = "https://api.chucknorris.io/jokes/"
    

    
    var lista: [String] = []
    
    class func loadCategories(onComplete: @escaping ([String]) -> Void) {

        
        let url = basePath + "categories"
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete([])
               
                return
            }
    
            do {
                let categories = try JSONDecoder().decode([String].self, from: data)
                onComplete(categories)
            }catch{
                print(error.localizedDescription)
                onComplete([])
            }
            
        }
    }
    
    class func loadCategory(name: String?, onComplete: @escaping (ChuckJokes?) -> Void) {
        
        let category = name
        let url = basePath + "random?category=" + category!

        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            
            do {
                let categoryInfo = try JSONDecoder().decode(ChuckJokes.self, from: data)
                print("category \(categoryInfo)")
                onComplete(categoryInfo)
            }catch{
                print("LoadCaterogyErro: \(error.localizedDescription)")
                onComplete(nil)
            }
            
            
        }
    }


}
