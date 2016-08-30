//
//  Pokemon.swift
//  PokedexGuidedProject
//
//  Created by Skylar Hansen on 8/30/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let id: Int
    let abilities: [String]
}

extension Pokemon {
    
    init?(dictionary: [String:AnyObject]) {
        guard let name = dictionary["name"] as? String,
            id = dictionary["id"] as? Int,
            abilitiesArray = dictionary["abilities"] as? [[String:AnyObject]] else { return nil }
        
        let abilityDictionaries = abilitiesArray.flatMap { $0["ability"] as? [String:AnyObject] }
        let abilities = abilityDictionaries.flatMap { $0["name"] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
    }
}























