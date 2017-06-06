//
//  Pokemon.swift
//  Pokedex
//
//  Created by Admin on 02/06/2017.
//  Copyright © 2017 Mattowy. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokeId: Int!
    
    var name: String {
        return _name
    }
    var pokeId: Int {
        return _pokeId
    }
    
    init(name: String, pokeId: Int) {
        self._name = name
        self._pokeId = pokeId
    }
}
