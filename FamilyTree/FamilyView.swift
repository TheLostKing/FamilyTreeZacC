//
//  FamilyView.swift
//  FamilyTree
//
//  Created by Zachary Calderone on 2/18/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import UIKit

class FamilyView: UIView {
    @IBOutlet weak var familyMemberPortrait: UIImageView?
    @IBOutlet weak var familyMemberName: UILabel?
    @IBOutlet weak var familyMemberDescription: UITextView?
    @IBOutlet weak var navigator: UITextField?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setFamilyMemberName(string: String){
        familyMemberName?.text = string
    }

}
