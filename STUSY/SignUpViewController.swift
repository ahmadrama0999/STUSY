//
//  SignUpViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 11.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var firstStepStackView: [UIStackView]!
    @IBOutlet var secondStepStackView: [UIStackView]!
    @IBOutlet var thirdStepStackView: [UIStackView]!
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
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
        hidingUI(step: stepCount)
    }
    
    func hidingUI(step: Int) {
        steps.forEach { (image) in
            image.image = #imageLiteral(resourceName: "ellipseEmpty")
        }
        steps[stepCount - 1].image = #imageLiteral(resourceName: "ellipseFill")
        
        switch stepCount {
        case 1: break
        case 2:
            //            UIView.transition(with: passwordTextField, duration: 0.4, options: [.transitionCrossDissolve], animations: {
            ////                self.firstStepStackView.isHidden = true
            //            })
            firstStepStackView.forEach { (view) in
                view.isHidden = true
            }
            secondStepStackView.forEach { (view) in
                view.isHidden = false
            }
            noteLabel.isHidden = false
            navigationController?.navigationBar.topItem?.title = "2 Step"
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(finishSighUp))
            navigationController?.reloadInputViews()
        case 3:
            secondStepStackView.forEach { (view) in
                view.isHidden = true
            }
            thirdStepStackView.forEach { (view) in
                view.isHidden = false
            }
            navigationController?.navigationBar.topItem?.title = "3 Step"
        default: break
        }
    }
    
    @objc func finishSighUp() {
        //TODO: Отправка данных на сервер или в локальную базу данных
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUp(_ sender: Any) {
        if stepCount < 3{
            stepCount += 1
            updateUI()
        } else {
            finishSighUp()
        }
    }
    
    
    
    
}

