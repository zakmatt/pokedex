//
//  Pokemon.swift
//  Pokedex
//
//  Created by Admin on 02/06/2017.
//  Copyright © 2017 Mattowy. All rights reserved.
//

import Foundation
import Alamofire // Alows us to do network calls

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokeId: Int!
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionTxt: String!
    fileprivate var _pokemonURL: String!
    
    var description: String {
        if _description == nil {
            return ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            return _type
        }
        return _type
    }
    
    var height: String {
        if _height == nil {
            return ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            return ""
        }
        return _weight
    }
    
    var defense: String {
        if _defense == nil {
            return ""
        }
        return _defense
    }
    
    var attack: String {
        if _attack == nil {
            return ""
        }
        return _attack
    }
    
    var nextEvolutionTxt: String {
        if _nextEvolutionTxt == nil {
            return ""
        }
        return _nextEvolutionTxt
    }
    
    var name: String {
        return _name
    }
    var pokeId: Int {
        return _pokeId
    }
    
    init(name: String, pokeId: Int) {
        self._name = name
        self._pokeId = pokeId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokeId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON{ (response) in
            if let dict = response.result.value as? Dictionary<String, Any> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for i in 1..<types.count {
                            if let name = types[i]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                            
                        }
                    }
                    
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["description"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let descURL = "\(BASE_URL)\(url)"
                        Alamofire.request(descURL).responseJSON { (response) in
                            if let descDict = response.result as? Dictionary<String, Any> {
                                
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
}
