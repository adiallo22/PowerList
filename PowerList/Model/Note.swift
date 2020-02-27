//
//  Note.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation
import RealmSwift

class Note : Object {
    
    @objc dynamic var message : String = ""
    @objc dynamic var done : Bool = false
    //
    let parentCategory = LinkingObjects(fromType: Item.self, property: "notes")
    
    
}
