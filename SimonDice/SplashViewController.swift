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
        
        imvSplash.alpha = 0.0
        imvSplash.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0) {
            let y = (self.view.frame.height - self.imvSplash.frame.height) / 2.0
            self.imvSplash.frame.origin.y = y
            self.imvSplash.alpha = 1.0
        }completion: { comp in
            self.performSegue(withIdentifier: "SgSplash", sender: nil)
        }

    }


}

