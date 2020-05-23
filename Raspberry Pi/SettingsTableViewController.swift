//
//  SecondViewController.swift
//  Raspberry Pi
//
//  Created by Marten Biesheuvel on 22/05/2020.
//  Copyright © 2020 Marten Biesheuvel. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var hostTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let stringHost = UserDefaults.standard.string(forKey: defaultsKeys.host) {
            hostTextField.text = stringHost
        }
        if let stringPort = UserDefaults.standard.string(forKey: defaultsKeys.port) {
            portTextField.text = stringPort
        }
    }
    
    @IBAction func editingHostTextView(_ sender: UITextField) {
        if let host = sender.text, !host.isEmpty {
            UserDefaults.standard.set(host, forKey: defaultsKeys.host)
        }
    }
    
    @IBAction func finishHostTextField(_ sender: UITextField) {
         self.view.endEditing(true)
    }
    
    @IBAction func editingPortTextView(_ sender: UITextField) {
        if let port = sender.text, !port.isEmpty {
            UserDefaults.standard.set(port, forKey: defaultsKeys.port)
        }
    }
    
    @IBAction func finishPortTextField(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
