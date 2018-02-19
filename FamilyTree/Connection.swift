//
//  Connection.swift
//  FamilyTree
//
//  Created by Zachary Calderone on 2/14/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import Foundation

enum Type{
    case Parent
    case Child
    case Spouse
}

struct Connection{
    var primeFamilyMember: FamilyMember
    var connectedFamilyMember: FamilyMember
    var connectionType: Type
}
