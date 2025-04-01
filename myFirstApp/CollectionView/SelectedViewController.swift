//
//  SelectedViewController.swift
//  myFirstApp
//
//  Created by Jayalakshmi
//

import UIKit
import CoreData
class SelectedViewController: UIViewController {
    
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var selectedView :UICollectionView?
    var selectedItem : String?
    var users: [Details] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedLabel.text = selectedItem ?? " "
        selectedView?.delegate = self
        selectedView?.dataSource = self
        selectedView?.register(UINib(nibName: "SelectedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectedCollectionViewCell")
        fetchUsersFromCoreData()
    }
    func fetchUsersFromCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<Details> = Details.fetchRequest()
        
        do {
            users = try context.fetch(request)
            selectedView?.reloadData()
        } catch {
            print("Failed to fetch users: \(error)")
        }
    }
    
    
    
}

extension SelectedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCollectionViewCell", for: indexPath) as! SelectedCollectionViewCell
       let user = users[indexPath.item]
        cell.collectionViewEmail.text = user.email
        cell.collectionViewPassword.text = user.password
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
}
