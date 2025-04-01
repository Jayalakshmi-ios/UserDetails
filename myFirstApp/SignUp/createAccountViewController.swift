//
//  createAccountViewController.swift
//  myFirstApp
//
//  Created by Jayalakshmi
//

import UIKit
import CoreData
class createAccountViewController: UIViewController {
    @IBOutlet weak var createPageInimage: UIImageView!
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var createNameText: UITextField!
    @IBOutlet weak var createPasswordText: UITextField!
    @IBOutlet weak var conformPasswordText: UITextField!
    @IBOutlet weak var hidepassButton: UIButton!
    @IBOutlet weak var hideconfButton: UIButton!
   //@IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    
    var context: NSManagedObjectContext {
            return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 10
        hidepassButton.setImage(UIImage(named: "eye-off 1"), for: .normal)
        hideconfButton.setImage(UIImage(named: "eye-off 1"), for: .normal)
        hideconfButton.setImage(UIImage(named: ""), for: .normal)
        // Do any additional setup after loading the view.
    }
    @IBAction func hideTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            createPasswordText.isSecureTextEntry = false
            hidepassButton.setImage(UIImage(named: "eye 1"), for: .normal)
            } else {
                createPasswordText.isSecureTextEntry = true
                hidepassButton.setImage(UIImage(named: "eye-off 1"), for: .normal)
            }
    }
    @IBAction func hideConfirmTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            conformPasswordText.isSecureTextEntry = false
            hideconfButton.setImage(UIImage(named: "eye 1"), for: .normal)
            } else {
                conformPasswordText.isSecureTextEntry = true
                hideconfButton.setImage(UIImage(named: "eye-off 1"), for: .normal)
            }
    }

    @IBAction func createTapped(_ sender: UIButton) {
        let newUser = Details(context: context)
        newUser.email = createNameText.text ?? ""
       newUser.password = createPasswordText.text ?? ""
       // Save the user to Core Data
       do {
           try context.save()
           print("User signed up successfully!")
       } catch {
            print("Failed to save user: \(error.localizedDescription)")
        }
    }
}
