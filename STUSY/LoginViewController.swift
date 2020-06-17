//
//  ViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 10.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftColor = UIColor(hex: 0x9BD56D)
        let rightColor = UIColor(hex: 0x0F9E98)
        loginButton.setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .leftToRight)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.layer.masksToBounds = true
        
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func signUpAction(_ sender: Any) {
//        guard let signUp = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "SignUpNavigationController") as? UINavigationController else { return }
//
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
//        sceneDelegate.window?.rootViewController = signUp.self
//        present(signUp, animated: true, completion: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainPage") as? UITabBarController else { return }
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = mainView.self
    }
    
}

