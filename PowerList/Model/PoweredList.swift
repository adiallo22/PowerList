//
//  PoweredList.swift
//  PowerList
//
//  Created by Abdul Diallo on 2/27/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation
import RealmSwift

class PoweredList : Object {
    
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    @objc dynamic var date : Date?
    //
    let items = List<Item>()
    
}
