//
//  ViewController.swift
//  myFirstApp
//
//  Created by Jayalakshmi 
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInimage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var createAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad() 
        signIn.layer.cornerRadius = 10
        createAccount.layer.cornerRadius = 10
        createAccount.layer.borderWidth = 1
        createAccount.layer.borderColor = UIColor.black.cgColor
        firstLabel.font = UIFont.boldSystemFont(ofSize: 29)
        secondLabel.numberOfLines = 2
        secondLabel.lineBreakMode = .byWordWrapping
        
        
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        print("Sign In button tapped!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            self.navigationController?.pushViewController(signInViewController, animated: true)
        }
    }
    @IBAction func createAccountTapped(_ sender: UIButton) {
        print("creat In button tapped!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let createAccoViewController = storyboard.instantiateViewController(withIdentifier: "createAccountViewController") as? createAccountViewController {
            self.navigationController?.pushViewController(createAccoViewController, animated: true)
        }
    }
}

