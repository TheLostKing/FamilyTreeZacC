//
//  LoadFamily.swift
//  FamilyTree
//
//  Created by Zachary Calderone on 2/15/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import Foundation

class LoadFamily{
    func load() -> [FamilyMember]{
        let family = PlistFile(name: "FamilyTreeData")
        let list = family.array!
        
        var familyMembers = [FamilyMember]()
        
        for i in list{
            var firstName: String = ""
            var lastName: String = ""
            var description: String = ""
            var connections = [String]()
            var count = 0
            for x in i as! [Any]{
                
                if x is String{
                    switch count{
                    case 0: firstName = x as! String; print(x)
                        case 1: lastName = x as! String; print(x)
                        case 2: description = x as! String; print(x)
                        default: print("error")
                    }
                } else{
                    connections = x as! [String]; print(x)
                }
                count += 1
            }
            familyMembers.append(FamilyMember(firstName: firstName, lastName: lastName, description: description, connections: connections))
        }
        return familyMembers
    }
    
    func loadConnections(familyMember: FamilyMember, list: [FamilyMember]){
        let connections = familyMember.connectionList
        var count = 0;
        var tupleList = [(FamilyMember, Type)]()
        var f: FamilyMember?
        var type: Type?
        for i in connections{
            if count % 2 != 0{
                f = stringToFamilyMember(string: i, list: list)
                tupleList.append((f!, type!))
                if f == nil{
                    print("problem with connection \(String(describing: f))")
                }
                if type == nil{
                    print("problem with connection \(String(describing: type))")
                }
            } else{
                type = familyMember.StringToTypeConversion(string: i)
            }
            count += 1
        }
        familyMember.loadConnections(connectionList: tupleList)
    }
    
    func stringToFamilyMember(string: String, list: [FamilyMember]) -> FamilyMember{
        var r: FamilyMember?
        for x in list{
            if string.elementsEqual(x.firstName){
                r = x
            }
        }
        if r == nil {
            print("error in String to family member for \(string)")
        }
        return r!
    }
    
    func stringToConnection(string: String) -> Type{
        switch string {
        case "Parent":
            return Type.Parent
        case "Spouse":
            return Type.Spouse
        case "Child":
            return Type.Child
        default:
            print("Error in converting \(string)")
            return Type.Error
        }
    }
}
