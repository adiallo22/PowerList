//
//  ItemViewController.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import RealmSwift

//private let reuseIdentifier = "Cell"

class ItemViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var completionBar: UIProgressView!
    
    var things : Results<Item>?
    
    let realm = try! Realm()
    
    private var count = 0
    
    var chosenPoweredList : PoweredList? {
        didSet {
            load()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        var toBeAdded = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alert) in
            alert.placeholder = "Enter New Item Here ..."
            toBeAdded = alert
        }
        let action = UIAlertAction(title: "add", style: .default) { (action) in
            
            if let curr = self.chosenPoweredList {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = toBeAdded.text!
                        curr.items.append(newItem)
                        self.count += 1
                        print(self.count)
                    }
                } catch {
                    print("error - saving ... - \(error)")
                }
            }
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}

//MARK: - section heading

extension ItemViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = 75.0
        navigationItem.title = chosenPoweredList?.name
    }
    
    func load() {
        things = chosenPoweredList?.items.sorted(byKeyPath: "title", ascending: true)
    }
    
    func updateUI() {
        
        //completionBar.observedProgress = count
        
    }
    
}



//MARK: - tableview data source

extension ItemViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let existingItem = things?[indexPath.row] {
            cell.textLabel?.text = existingItem.title
        } else {
            cell.textLabel?.text = "No Item"
        }
        return cell
    }
    
}



//MARK: - tableview delegate

extension ItemViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! NoteViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.chosenItem = things?[indexpath.row]
        }

    }
    
}
