//
//  SignUpViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 11.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var stepCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftColor = UIColor(hex: 0x9BD56D)
        let rightColor = UIColor(hex: 0x0F9E98)
        signUpButton.setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .leftToRight)
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        signUpButton.layer.masksToBounds = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
