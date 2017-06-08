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
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionTxt: String!
    
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
