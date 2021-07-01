//
//  PlaceModel.swift
//  Places
//
//  Created by Artyom on 2.07.21.
//

import Foundation


public struct  Place {
    
    
    var name: String
    var location: String
    var type: String
    var image: String
    
    
    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]

    static func getPlaces() ->[Place] {
        var places = [Place]()
        for place in restaurantNames {
            places.append(Place(name: place, location: "Ufa", type: "Rest", image: place))
        }
        
        return places
    }
    
}
