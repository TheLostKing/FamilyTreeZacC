//
//  FamilyMemberViewController.swift
//  FamilyTree
//
//  Created by Zachary Calderone on 2/14/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import UIKit

class FamilyMemberViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var familyMemberName: UILabel!
    @IBOutlet weak var familyMemberDescription: UITextView!
    @IBOutlet weak var familyMemberImage: UIImageView!
    var familyList: [FamilyMember]!
    var connectionList: [Connection]!
    var picker: UIPickerView!
    
    @IBOutlet weak var familyMemberPicker: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loader = LoadFamily()
        familyList = loader.load()
        for i in familyList{
            loader.loadConnections(familyMember: i, list: familyList)
        }
        loadPerson(familyMember: 0)
        picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        familyMemberPicker.inputView = picker
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPerson(familyMember: Int){
        familyMemberName.text = "\(familyList[familyMember].firstName) \(familyList[familyMember].lastName)"
        familyMemberDescription.text = familyList[familyMember].description
        familyMemberImage.image = familyList[familyMember].picture
        connectionList = familyList[familyMember].connections
    }
    
    func loadPerson(familyMember: FamilyMember){
        familyMemberName.text = "\(familyMember.firstName) \(familyMember.lastName)"
        familyMemberDescription.text = familyMember.description
        familyMemberImage.image = familyMember.picture
        connectionList = familyMember.connections
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return connectionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(connectionList[row].connectedFamilyMember.firstName) \(connectionList[row].connectedFamilyMember.lastName) - \(connectionList[row].connectionType)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        familyMemberPicker.text = "\(connectionList[row].connectedFamilyMember.firstName) \(connectionList[row].connectedFamilyMember.lastName)"
        let f = connectionList[row].connectedFamilyMember
        familyMemberPicker.resignFirstResponder()
        connectionList.removeAll()
        loadPerson(familyMember: f)
        pickerView.reloadAllComponents()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
