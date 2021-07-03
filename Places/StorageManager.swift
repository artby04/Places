//
//  StorageManager.swift
//  Places
//
//  Created by Artyom on 3.07.21.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place) {
        try! realm.write{
            realm.add(place)
        }
    }
}
