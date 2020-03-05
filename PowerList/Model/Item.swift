//
//  Item.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var date : Date?
    //
    let parentCategory = LinkingObjects(fromType: PoweredList.self, property: "items")
    let notes = List<Note>()
    
}
