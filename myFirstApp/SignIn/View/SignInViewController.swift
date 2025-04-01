//
//  SignInViewController.swift
//  myFirstApp
//
//  Created by Jayalakshmi
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    @IBOutlet weak var signPageInimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var visibility: UIButton!
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        create.layer.cornerRadius = 10
        nameText.layer.cornerRadius = 10
        passwordText.layer.cornerRadius = 10
        visibility.setImage(UIImage(named: "eye-off 1"), for: .normal)
    }
    @IBAction func hideTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordText.isSecureTextEntry = false
            visibility.setImage(UIImage(named: "eye 1"), for: .normal)
        } else {
            passwordText.isSecureTextEntry = true
            visibility.setImage(UIImage(named: "eye-off 1"), for: .normal)
        }
    }
    @IBAction func signInTapped(_ sender: UIButton) {
        let fetchRequest: NSFetchRequest<Details> = Details.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", nameText.text ?? "")
        
        do {
            let users = try context.fetch(fetchRequest)
            
            if users.first != nil {
                print("Login successful!")
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let tableViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
                     tableViewController.userEmail = nameText.text ?? ""
                    self.navigationController?.pushViewController(tableViewController, animated: true)
                }
            } else {
                print("Invalid username or password.")
            }
        } catch {
            print("Failed to fetch user: \(error.localizedDescription)")
        }
    }
    
}
