//
//  PokemonController.swift
//  PokedexGuidedProject
//
//  Created by Skylar Hansen on 8/30/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
    
    static func fetchPokemon(searchTerm: String, completion: (pokemon: Pokemon?) -> Void) {
        
        let searchURL = baseURL + searchTerm.lowercaseString
        let url = NSURL(string: searchURL)
        
        guard let unwrappedURL = url else {
            completion(pokemon: nil)
            print("Optional URL is nil")
            return
        }
        
        NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
            guard let data = data,
            jsonAnyObject = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
            jsonDictionary = jsonAnyObject as? [String:AnyObject] else {
                    completion(pokemon: nil)
                    print("Error, no data found.\n \(error?.localizedDescription)")
                    return
            }
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon: pokemon)
        }
    }
}






