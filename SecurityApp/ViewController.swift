//
//  ViewController.swift
//  SecurityApp
//
//  Created by Jack on 5/20/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit
import Kanna
import Alamofire

// Grabs the HTML from nycmetalscene.com for parsing.
func scrapeNYCMetalScene() -> Void {
    Alamofire.request("http://nycmetalscene.com").responseString { response in
        print("\(response.result.isSuccess)")
        if let html = response.result.value {
            self.parseHTML(html: html)
        }
    }
}

func parseHTML(html: String) -> Void {
    // Finish this next
}

class ViewController: UIViewController {
    var userInput : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func catagorizeUserInput() {
        for i in userInput.characters {
            if i == "@" {
                //threat = email
            }
            if i == ":" {
                //threat = e
            }
            else {
                //threat = app
            }
        }
    }

//removed it :)
}

