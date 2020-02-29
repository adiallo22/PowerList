//
//  ViewController.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/19/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var completedLabel: UILabel!
    
    var lists : Results<PoweredList>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        load()
        navigationItem.title = "My Power List"
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
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
        
    }

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let existingList = lists?[indexPath.row] {
            cell.textLabel?.text = existingList.name
        } else {
            cell.textLabel?.text = "Empty List"
        }
        return cell
    }
    
}

//MARK: - <#section heading#>



