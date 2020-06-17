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
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var passwordTextField: UITextField!
    var stepCount: Int = 1
    
    @IBOutlet var steps: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftColor = UIColor(hex: 0x9BD56D)
        let rightColor = UIColor(hex: 0x0F9E98)
        signUpButton.setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .leftToRight)
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        signUpButton.layer.masksToBounds = true
        
    }
    
    func updateUI() {
        fill(step: stepCount)
    }
    
    func fill(step: Int) {
        steps.forEach { (image) in
            image.image = #imageLiteral(resourceName: "ellipseEmpty")
        }
        steps[stepCount - 1].image = #imageLiteral(resourceName: "ellipseFill")
        
        switch stepCount {
        case 1:
            break
        case 2:
            UIView.transition(with: passwordTextField, duration: 0.4, options: [.transitionCrossDissolve], animations: {
                self.passwordStackView.isHidden = true
            })
        case 3:
            break
        default: break
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        guard stepCount < 3 else { return }
        stepCount += 1
        updateUI()
    }
    
    
}

