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
    
    var threat : String!
    var desc : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
