//
//  HelpViewController.swift
//  SecurityApp
//
//  Created by Megan Kaye on 5/21/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    //ignore this
    @IBOutlet var titleLabel: UIView!
    //ignore that
    
    @IBOutlet weak var realTitleLabel: UILabel!
    var type : String!
    var helpfulWebLinks = ["https://www.digicert.com/blog/buy-site-know-website-secure/", "https://www.microsoft.com/en-us/safety/pc-security/malware-protect.aspx", "https://security.illinois.edu/content/protecting-yourself-malware"]
    var helpfulEmailLinks = ["http://abcnews.go.com/Business/top-things-email-hacked/story?id=19715483", "http://www.cbsnews.com/news/5-must-do-steps-if-your-email-gets-hacked/", "http://www.businessinsider.com/how-to-avoid-being-hacked-2015-4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        realTitleLabel.text = "What To Do if Your " + type + " is in Danger"

        // Do any additional setup after loading the view.
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
