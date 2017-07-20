//
//  PokeCell.swift
//  Pokedex
//
//  Created by Admin on 06/06/2017.
//  Copyright © 2017 Mattowy. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell, ReusableView {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokeId)")
    }
}
