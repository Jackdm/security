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

    @IBOutlet weak var safetyTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        catagorizeUserInput()
        safetyTextField
    }
    
    func segueToDataPage() {
        performSegue(withIdentifier: "submitSegue", sender: nil)
    }
    
    func catagorizeUserInput() {
        for i in userInput.characters {
            if i == "@" {
                //threat = email
                segueToDataPage()
            }
            if i == ":" {
                //threat = e
                segueToDataPage()
            }
            else {
                //threat = app
                segueToDataPage()
            }
        }
    }
    
    func getWebSafety() {
        var APIKey = "AIzaSyBfSH3lILjmW2wJgRcLpG-mItRr05X1U9k"
        var clientName = "Security App"
        var clientVersion = 1.0
        var pver   = 3.0
        var url = userInput
    }

//removed it :)
}

