//
//  FamilyMember.swift
//  FamilyTree
//
//  Created by Zachary Calderone on 2/14/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import Foundation
import UIKit

enum Type{
    case Parent
    case Child
    case Spouse
    case Error
}

struct Connection{
    var primeFamilyMember: FamilyMember
    var connectedFamilyMember: FamilyMember
    var connectionType: Type
}

class FamilyMember{
    var firstName: String
    var lastName: String
    var description: String
    var picture: UIImage?
    var connections = [Connection]()
    var connectionList: [String]
    
    init(firstName f: String, lastName l: String, description d: String, connections c: [String]) {
        firstName = f
        lastName = l
        description = d
        connectionList = c
        picture = UIImage(named: firstName)
    }
    
    func loadConnections(connectionList: [(FamilyMember, Type)]){
        for i in connectionList{
            let (connectee, type) = i
            connections.append(Connection(primeFamilyMember: self, connectedFamilyMember: connectee, connectionType: type))
        }
    }
    
    
    func StringToTypeConversion(string: String) -> Type{
        switch string{
            case "Parent": return Type.Parent
            case "Child": return Type.Child
            case "Spouse": return Type.Spouse
            default:
                print("Error has occured for string: \(string)")
                return Type.Error
        }
    }
}
