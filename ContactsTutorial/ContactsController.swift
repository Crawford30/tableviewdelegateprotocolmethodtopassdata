//
//  ContactsController.swift
//  ContactsTutorial
//
//  Created by JOEL CRAWFORD on 01/01/2019.
//  Copyright © 2019 RTS. All rights reserved.
//

import UIKit
private  let reusaubleidentifier = "cell"
//============STRUCT FOR POPULATING TABLE VIEW====

struct Contact {
    var fullname: String
    
}



class ContactsController: UITableViewController {
    
    //============creating an array of contact objects=====
    var contacts = [Contact]()
    
    let reusaubleidentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contacts"
        
        ///=======creating a bar button=====
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        view.backgroundColor = .white
        
        //=========register table view cell====
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reusaubleidentifier)
        
    }
    
    //==========MARK: -selector===========
    
    @objc func handleAddContact() {
        //======present the view controller in the navigation controller on handle add clicked==
        
        //self.present(UINavigationController(rootViewController: AddContactController() ), animated: true, completion: nil)
        let controller = AddContactController()
        controller.delegate = self /// self in reference to the contact controller
        
        //=====since we conform to the controller==
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        
    }
    //MARK: - =========UITABLEVIEW========
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    //MARK: - =======CELL FOR ROW AT======
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusaubleidentifier, for: indexPath)
        //========Getting each element in its own cell====
        cell.textLabel?.text = contacts[indexPath.row].fullname
        
        return cell
        
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

//====conforming to the delegate method======
extension ContactsController: AddContactDelegate {
    func addContact(contact: Contact) {
        //=====dismiss the view controller==
        self.dismiss(animated: true) {
            
            //=====append our contact to array==
            self.contacts.append(contact)
            
            //=====reload our table view===
            self.tableView.reloadData()
            
        }
        //=====append our contact to array==
        
        //=====reload our table view===
        
        
    }
    
}
