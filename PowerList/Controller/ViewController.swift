//
//  ViewController.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/19/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var score = 0
    
    var lists : Results<PoweredList>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "My Power List"
        tableView.rowHeight = 75.0
    }

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var newList = UITextField()
        let alert = UIAlertController(title: "Add New List", message: "", preferredStyle: .alert)
        alert.addTextField { (alert) in
            alert.placeholder = "Type List Here ..."
            newList = alert
        }
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newItem = PoweredList()
            newItem.name = newList.text!
            newItem.date = Date()
            self.tableView.reloadData()
            self.save(list: newItem)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - functions of realm

extension ViewController {
    
    func load () {
        lists = realm.objects(PoweredList.self)
        tableView.reloadData()
    }
    
    func save(list : PoweredList) {
        do {
            try realm.write {
                realm.add(list)
            }
        } catch {
            print("error saving - \(error)")
        }
        tableView.reloadData()
    }
    
}

//MARK: - tableview data source

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let existingList = lists?[indexPath.row] {
            cell.textLabel?.text = existingList.name
        } else {
            cell.textLabel?.text = "Empty List"
            print("emplty list")
        }
        return cell
    }
    
}

//MARK: - tableview delegate

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItem", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ItemViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.chosenPoweredList = lists?[indexpath.row]
        }
    }
    
}



