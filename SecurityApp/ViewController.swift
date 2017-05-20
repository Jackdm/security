//
//  ViewController.swift
//  SecurityApp
//
//  Created by Jack on 5/20/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var userInput : String!
    var unfData : String!

    @IBOutlet weak var pwnData: UILabel!
    @IBOutlet weak var safetyTextField: UITextField!
    
    
    func pwnCheck() {
        let url = URL(string: "https://haveibeenpwned.com/api/v2/breachedaccount/george@gmail.com?truncateResponse=true")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("\(String(describing: error))")
                return
            }
            
            self.unfData = String(data: data, encoding: .utf8)
            print(self.unfData)
            pwnData.text = self.unfData
        }
        
        pwnCheck()}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        catagorizeUserInput()
        //userInput = safetyTextField.text
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
        //var url = userInput
    }

//removed it :)
}
