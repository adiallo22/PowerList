//
//  NoteViewController.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit
import RealmSwift

class NoteViewController: UIViewController {
    
    @IBOutlet weak var completionStatus: UISegmentedControl!
    @IBOutlet weak var report: UILabel!
    @IBOutlet weak var userNote: UITextField!
    
    var note : Results<Note>?
    
    let realm = try! Realm()
    
    var chosenItem : Item? {
        didSet {
            load()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func load() {
        note = chosenItem?.notes.sorted(byKeyPath: "date", ascending: true)
    }
    
    func updateUI() {
        
        
        
    }

    @IBAction func completedOrNot(_ sender: UISegmentedControl) {
        
//        if let curr = self.chosenItem {
//
//            do {
//                
//                try realm.write {
//
//                    let newNote = Note()
//                    newNote.date = Date()
//                    if sender.selectedSegmentIndex == 0 {
//                        newNote.message = "YOU NEED TO COMPLETE THE TASK"
//                        report.text = newNote.message
//                        newNote.done = false
//                    } else {
//                        newNote.message = "WELL DONE !"
//                        report.text = newNote.message
//                        newNote.done = true
//                    }
//                    curr.notes.append(newNote)
//                }
//
//            } catch {
//                print("error saving new notes - \(error)")
//            }
//        }
        
    }
    
}

/*
 */
