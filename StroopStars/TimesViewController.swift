//
//  TimesViewController.swift
//  StroopStars
//
//  Created by Jasper Cruz on 3/31/20.
//  Copyright © 2020 Jasper Cruz. All rights reserved.
//

import UIKit

class TimesViewController: UIViewController {
    
    var name: String?
    var bestMode1Time: String?
    var bestMode2Time: String?
    
    @IBOutlet weak var mode1Time: UILabel!
    @IBOutlet weak var mode2Time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage (named:"BackgroundImage4")!)
        mode1Time.text = "\(String(describing: name ?? "nil")): \(String(describing: bestMode1Time ?? "nil"))"
        mode2Time.text = "\(String(describing: name ?? "nil")): \(String(describing: bestMode2Time ?? "nil"))"
    }

    
}
