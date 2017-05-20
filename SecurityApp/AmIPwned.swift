//
//  File.swift
//  SecurityApp
//
//  Created by Jack on 5/20/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import Foundation

import UIKit

var unfData : String!
let url = URL(string: "https://haveibeenpwned.com/api/v2/breachedaccount/george@gmail.com?truncateResponse=true")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
        print("\(String(describing: error))")
        return
    }
    
    unfData = String(data: data, encoding: .utf8)
    
    print(unfData)
    
    
}

