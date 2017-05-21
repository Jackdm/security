//
//  AdviceViewController.swift
//  SecurityApp
//
//  Created by Megan Kaye on 5/21/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit

class AdviceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let advice = ["https://www.microsoft.com/en-us/safety/pc-security/protect-pc.aspx","http://www.foxnews.com/tech/2014/05/02/how-to-protect-your-computer-from-viruses-and-hackers.html", "https://oag.ca.gov/privacy/facts/online-privacy/protect-your-computer", "https://www.goucher.edu/information-technology/security-and-policies/protecting-your-computer"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return advice.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = advice[indexPath.row]
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: advice[indexPath.row]) {
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
