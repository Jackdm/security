//
//  WebViewController.swift
//  SecurityApp
//
//  Created by Megan Kaye on 5/21/17.
//  Copyright © 2017 jackdm. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var viewWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://www.bideawee.org/")
        if let unwrappedURL = url {
            
            let request = URLRequest(url: unwrappedURL)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    self.viewWebView.loadRequest(request)
                    
                } else {
                    
                    print("ERROR: \(error)")
                    
                }
                
            }
            
            task.resume()
            
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
