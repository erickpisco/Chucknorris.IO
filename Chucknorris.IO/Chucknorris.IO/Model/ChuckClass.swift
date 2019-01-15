//
//  ChuckClass.swift
//  Chucknorris.IO
//
//  Created by erick pisco on 11/30/18.
//  Copyright © 2018 erick pisco. All rights reserved.
//

import Foundation



struct ChuckJokes: Codable {
    
    let category: [String]?
    let icon_url: String
    let id: String
    let url: String
    let value: String
}
