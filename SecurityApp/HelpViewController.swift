//
//  HelpViewController.swift
//  SecurityApp
//
//  Created by Megan Kaye on 5/21/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //ignore this
    @IBOutlet var titleLabel: UIView!
    //ignore that
    
    @IBOutlet weak var realTitleLabel: UILabel!
    var type : String!
    var chosenArray = [String]()
    let helpfulWebLinks = ["https://www.digicert.com/blog/buy-site-know-website-secure/", "https://www.microsoft.com/en-us/safety/pc-security/malware-protect.aspx", "https://security.illinois.edu/content/protecting-yourself-malware"]
    let helpfulEmailLinks = ["http://abcnews.go.com/Business/top-things-email-hacked/story?id=19715483", "http://www.cbsnews.com/news/5-must-do-steps-if-your-email-gets-hacked/", "http://www.businessinsider.com/how-to-avoid-being-hacked-2015-4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        realTitleLabel.text = "What To Do if Your " + type + " is in Danger"
        
        if type == "Email" {
            chosenArray = helpfulEmailLinks
        } else {
            chosenArray = helpfulWebLinks
        }
        print(chosenArray)
        // Do any additional setup after loading the view.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return chosenArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = chosenArray[indexPath.row]
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: chosenArray[indexPath.row]) {
            UIApplication.shared.open(url, options: [:])
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
