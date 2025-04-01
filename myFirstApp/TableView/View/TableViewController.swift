//
//  TableViewController.swift
//  myFirstApp
//
//  Created by Jayalakshmi 
//

import UIKit
import CoreData

struct Item: Codable {
    let title: String
    let userId: Int
    let id: Int
    let body: String
}
class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var userEmail: String?
    var items: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInitilization()
    }
    func tableViewInitilization(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "TableTableViewCell", bundle: nil), forCellReuseIdentifier: "TableTableViewCell")
        fetchData()
    }
    
    func fetchData() {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Item].self, from: data)
                        self.items = result
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(" error: \(error)")
                    }
                }
            }.resume()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableTableViewCell") as? TableTableViewCell
        cell?.userlabel.text = String(items[indexPath.row].userId )
        cell?.idlabel.text = String(items[indexPath.row].id)
        cell?.titlelabel.text = items[indexPath.row].title
        cell?.bodylabel.text = items[indexPath.row].body
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            
            if let selectedViewController = storyboard?.instantiateViewController(withIdentifier: "SelectedViewController") as? SelectedViewController {
                if let cell = tableView.cellForRow(at: indexPath) as? TableTableViewCell {
                    selectedViewController.selectedItem = cell.idlabel.text
                }
                self.navigationController?.pushViewController(selectedViewController, animated: true)
            }
        }
}


