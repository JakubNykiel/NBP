//
//  TodayTableViewController.swift
//  NBP
//
//  Created by Jakub Nykiel on 01.09.2016.
//  Copyright © 2016 Jakub Nykiel. All rights reserved.
//

import UIKit
import SwiftyJSON

class TodayTableViewController: UITableViewController {
    
    let json = MyJSON()
    var objects = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        objects = json.parseJSON()
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCell", for: indexPath) as! MyCustomTableViewCell
       
        cell.codeLabel.text = objects[(indexPath as NSIndexPath).row]["code"]! as String
        cell.titleLabel.text = objects[(indexPath as NSIndexPath).row]["title"]! as String
        cell.valueLabel.text = objects[(indexPath as NSIndexPath).row]["ask"]! as String + "zł"
        return cell
    }
    

}
