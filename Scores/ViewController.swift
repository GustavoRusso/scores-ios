//
//  ViewController.swift
//  Scores
//
//  Created by Gustavo on 24/11/15.
//  Copyright © 2015 Gustavo Russo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segueToAddNewScore(sender: UIBarButtonItem) {
        let addNewScoreStoryboard: UIStoryboard = UIStoryboard(name: "AddLocation", bundle: nil)
        let addNewScoreViewController = addNewScoreStoryboard.instantiateInitialViewController()
        self.presentViewController(addNewScoreViewController!, animated:  true, completion: nil)
    }
    
    @IBAction func unwindToMainController(segue:UIStoryboardSegue) {
        
    }

}

