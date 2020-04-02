//
//  ModeSelectViewController.swift
//  StroopStars
//
//  Created by Jasper Cruz on 3/31/20.
//  Copyright © 2020 Jasper Cruz. All rights reserved.
//

import UIKit

class ModeSelectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage (named:"BackgroundImage2")!)
    }
    
    @IBOutlet weak var selectModeLabel: UILabel!
    
    @IBAction func mode1Button(_ sender: Any) {
        selectModeLabel.text = "Mode 1 Selected!"
        let barViewControllers = self.tabBarController?.viewControllers
        let game = barViewControllers![1] as! GameViewController
        game.selection = "1"
        game.viewDidLoad()
    }
    
    
    @IBAction func mode2Button(_ sender: Any) {
        selectModeLabel.text = "Mode 2 Selected!"
        let barViewControllers = self.tabBarController?.viewControllers
        let game = barViewControllers![1] as! GameViewController
        game.selection = "2"
        game.viewDidLoad()
    }
    

}
