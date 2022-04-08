//
//  Book.swift
//  Favorite Books 2
//
//  Created by Navid on 1/7/22.
//

import Foundation


struct Book {
    
    var title: String
    var author: String
    var genre: String
    var length: String
    
    var description: String{
        return "\(title) is written by \(author) and have a \(genre) genre with \(length) length"
        
    }
    
    
}
