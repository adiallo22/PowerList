//
//  ItemViewController.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class ItemViewController: UICollectionViewController, UITableViewDataSource {
    
    var items : Results<Item>?
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let existingItem = items?[indexPath.row] {
            cell.textLabel?.text = existingItem.title
        } else {
            cell.textLabel?.text = "No Item"
        }
        return cell
    }

}
