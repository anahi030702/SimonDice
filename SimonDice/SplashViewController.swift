//
//  ViewController.swift
//  SimonDice
//
//  Created by imac on 29/10/24.
//

import UIKit

class SplashViewController: UIViewController
{

    @IBOutlet weak var imvSplash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.frame.width * 0.9
        let h = w * 1
        let x = (view.frame.width - w)/2
        let y = -h
        
        imvSplash.frame = CGRect(x: x, y: y, width: w, height: h)
    }


}

