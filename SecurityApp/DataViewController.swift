//
//  DataViewController.swift
//  SecurityApp
//
//  Created by Megan Kaye on 5/21/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var threatLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var helpButton: UIButton!
    
    var type : String!
    var threat : String!
    var desc : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recLabel.isHidden = true
        helpButton.isHidden = true
        if type == "Email" {
            threatLabel.text = "Your email is " + threat + "!"
            descLabel.text = ""
            if threat != "safe" {
                descLabel.text = desc + " has hacked your email."
            }
        }
        else if type == "Website" {
            threatLabel.text = "This website is " + threat + " !"
            descLabel.text = ""
            if threat != "safe" {
                descLabel.text = "This website is unsafe because of " + desc + "."
            }
        } else {
            threatLabel.text = "We're sorry, we couldn't find a website or email with that address. Please try again."
            descLabel.text = ""
        }
        
        if threat == "unsafe" {
            recLabel.isHidden = false
            helpButton.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "helpSegue" {
            let nextVC = segue.destination as! HelpViewController
            nextVC.type = self.type

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
