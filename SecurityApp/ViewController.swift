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
    
    var verdict : String!
    var reason : String!
    
    @IBOutlet weak var pwnData: UILabel!
    @IBOutlet weak var safetyTextField: UITextField!
    
    
    func pwnCheck() {
        let url = URL(string: "https://haveibeenpwned.com/api/v2/breachedaccount/george@gmail.com?truncateResponse=true")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        self.pwnData.text = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String?)
        }
        task.resume()
    }
    
    
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
        var clientName = "SecurityApp"
        var clientVersion = "1.0"
        var pver   = "3.1"
        var noturl = userInput
        var url = noturl?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        var subu = "https://sb-ssl.google.com/safebrowsing/api/lookup?client=" + clientName + "&key=" + APIKey
        var u = "&appver=" + clientVersion
        var r = "&pver=" + pver + "&url=" + url!
        var completeu = subu + u + r
        

        func HTTPsendRequest(request: NSMutableURLRequest,callback: @escaping (String, String?) -> Void) {
            
            let task = URLSession.shared.dataTask(with: request as URLRequest,completionHandler :
                {
                    data, response, error in
                    if error != nil {
                        callback("", (error!.localizedDescription) as String)
                    } else {
                        callback(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String,nil)
                    }
            })
            
            task.resume() //Tasks are called with .resume()
            
        }
        
        func HTTPGet(url: String, callback: @escaping (String, String?) -> Void) {
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL) //To get the URL of the receiver , var URL: NSURL? is used
            HTTPsendRequest(request: request, callback: callback)
        }
        
        HTTPGet(url: completeu) {
            (data: String, error: String?) -> Void in
            if (data != "") {
                self.verdict = "Unsafe!"
                self.reason = data
            } else {
                self.verdict = "Safe!"
                self.reason = ""
            }
        }
        sleep(10)
    }

//removed it :)
}

       // let task = URLSession.shared.dataTask(with: url) { data, response, error in
        //    guard let data = data, error == nil else {
        //        print("\(String(describing: error))")
          //      return
         //   }
//
          //  self.unfData = String(data: data, encoding: .utf8)
          //  print(self.unfData)
         //   self.pwnData.text = self.unfData
