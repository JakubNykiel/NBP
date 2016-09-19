//
//  JSON.swift
//  NBP
//
//  Created by Jakub Nykiel on 01.09.2016.
//  Copyright © 2016 Jakub Nykiel. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyJSON {
    
    var objects = [[String: String]]()
    
    func parseJSON() -> [[String: String]] {
        let urlString = "http://api.nbp.pl/api/exchangerates/tables/C/"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                for result in json[0]["rates"].arrayValue {
                    let title = result["currency"].stringValue
                    let code = result["code"].stringValue
                    let ask:Double = result["ask"].doubleValue
                    let ask_string = String(format: "%.4f", ask)
                    let obj = ["title": title, "code": code, "ask": ask_string]
                    objects.append(obj)
                    
                }
            }
        }
        return objects
    }
    
    
}
