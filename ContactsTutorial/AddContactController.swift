//
//  AddContactController.swift
//  ContactsTutorial
//
//  Created by JOEL CRAWFORD on 01/01/2019.
//  Copyright © 2019 RTS. All rights reserved.
//

import UIKit
//=========passing data using protocol===

protocol AddContactDelegate {
    func addContact(contact: Contact)
}

class AddContactController: UIViewController {
    //=======creating a var ====
    var delegate: AddContactDelegate? ///access all the method associated with this delegate in the in this VC link between 2 VCS
    
    //=============CREATING TEXTFIELD, textview PROGRAMATICALLY===
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full name"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false ////allows to programatically set out constarints
        return tf
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //=====addding the text field as a subview
        view.addSubview(textField)
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true //center on y axis
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true ///center textfield on x axis
        textField.widthAnchor.constraint(equalToConstant: view.frame.width  - 64).isActive = true //gives 32 pixel of paddind on each side. (-64 meaning)
        textField.becomeFirstResponder()
        
        
        
        ///=======creating a bar button===============================
        //=======================right bar item =================
               self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        //=====left bar item ===============================
          self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

    //========MARRK:   selectors ===
    //================================for right bar======================
    @objc func handleDone() {
        guard let fullname = textField.text, textField.hasText else {
            print("hamndle error here...")
            return
        }
        //====getting the data====
        let contact = Contact(fullname: fullname)
        print(contact.fullname)
        //====add contact when done button is clicked
        delegate?.addContact(contact: contact)

        
    }
    //===========================for left bar===========================
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
