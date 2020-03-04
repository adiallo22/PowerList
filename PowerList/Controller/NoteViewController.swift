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
    
    var notes : Results<Note>?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}
