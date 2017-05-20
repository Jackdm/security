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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        userInput = safetyTextField.text
        catagorizeUserInput()
    }
    
    func segueToDataPage() {
        performSegue(withIdentifier: "submitSegue", sender: nil)
    }
    
    func catagorizeUserInput() {
        print(userInput)
        for i in userInput.characters {
            print(i)
            if i == "@" {
                //threat = email
                print("Email!")
                pwnCheck()
                segueToDataPage()
                return
                
            }
            else if i == ":" {
                //threat = e
                print("Website!")
                getWebSafety()
                segueToDataPage()
                return
            }
            
        }
        print("Misc!")
        segueToDataPage()
        //threat = app
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
                self.verdict = "This website is unsafe!"
                self.reason = "This website is unsafe because of " + data
            } else {
                self.verdict = "This website is safe!"
                self.reason = ""
            }
        }
        sleep(10)
    }
    
    func pwnCheck() {
        var e = userInput
        var emailLink = "https://haveibeenpwned.com/api/v2/breachedaccount/" + e! +
        "?truncateResponse=true"
        var truncString = ""
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
        
        HTTPGet(url: emailLink) {
            (data: String, error: String?) -> Void in
            if data == "" {
                self.verdict = "Your email has not been hacked!"
                self.reason = ""
            } else {
                var foundColon = false
                for i in data.characters {
                    if foundColon && i != "\"" && i != "}" && i != "]"  {
                        truncString += String(i)
                    }
                    else if !foundColon && i == ":" {
                        foundColon = true
                    }
                self.verdict = "Your email has been hacked!"
                self.reason = truncString + " has hacked your email!"
                }
            }
        }
        sleep(10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "submitSegue" {
            let nextVC = segue.destination as! DataViewController
            nextVC.threat = self.verdict
            nextVC.desc = self.reason
        }
    }
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
