//
//  ViewController.swift
//  My Test
//
//  Created by Dixit, Arun on 24/07/18.
//  Copyright © 2018 Dixit, Arun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtn_TouchUpInside(_ sender: Any) {
        ProgressBar.showProgress()
        NetworkManager.sharedManager.loginWithCompletionBlock(user: "test", pwd: "test") { (response) in
            //test code
            self.loginBtn.setTitle("Logged In", for: UIControlState.normal)
            ProgressBar.hideProgress()
        }
    }
    
}

