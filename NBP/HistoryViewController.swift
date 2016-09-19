//
//  HistoryViewController.swift
//  NBP
//
//  Created by Jakub Nykiel on 01.09.2016.
//  Copyright © 2016 Jakub Nykiel. All rights reserved.
//

import UIKit
import DropDown

class HistoryViewController: UIViewController {

    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    var objects = [[String: String]]()
    var code = [String]()
    let json = MyJSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        objects = json.parseJSON()
//        print(objects)
    }
    
    @IBAction func dropdownButton(_ sender: AnyObject) {
        
        let count = objects.count
        
        self.view.endEditing(true)

        for index in 0..<count{
            let code_s = objects[index]["code"]! as String
            code.append(code_s)
        }
        let dropDown = DropDown()
        dropDown.anchorView = dropdownView
        dropDown.dataSource = code 
        dropDown.width = 80
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let amount = Double(self.amountTextField.text!)
            let name = self.objects[index]["code"]!
            let ask = self.objects[index]["ask"]!
            let ask_double = Double(ask)
            var result = String(amount! / ask_double!)
            result = String(format: "%.2f", result)
            self.resultLabel.text = "Za " + String(amount!) + " PLN otrzymasz " + result + " " + name
        }
        
        dropDown.show()
        code.removeAll()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

