//
//  ViewController.swift
//  StroopStars
//
//  Created by Jasper Cruz on 3/31/20.
//  Copyright © 2020 Jasper Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var enterNameButton: UIButton!
    var name: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage (named:"BackgroundImage")!)
    }
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barViewControllers = segue.destination as! UITabBarController
        let destinationViewController = barViewControllers.viewControllers![2] as! TimesViewController
        destinationViewController.name = nameTextBox.text
    }
}

