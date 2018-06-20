//
//  Character.swift
//  Magus
//
//  Created by Student on 2018. 06. 07..
//  Copyright © 2018. BRM. All rights reserved.
//

import Foundation

class Character {

    var name: String!
    var clas: String!
    var religion: String?
    var age: Int8?
    var homeland: String?
    var race: String!
    var level: Int8!
    var exp: Int8!
    
    init(iname: String, iclass: String, irace: String, ilevel: Int8, iexp: Int8) {
        // perform some initialization here
        name = iname
        clas = iclass
        race = irace
        level = ilevel
        exp = iexp
        
    }


}
