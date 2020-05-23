//
//  FirstViewController.swift
//  Raspberry Pi
//
//  Created by Marten Biesheuvel on 22/05/2020.
//  Copyright © 2020 Marten Biesheuvel. All rights reserved.
//

import UIKit
import Alamofire
import Toast

class LCDTableViewController: UITableViewController {

    var firstRow: String?
    var secondRow: String?
    
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func editingFirstRowTextView(_ sender: UITextField) {
        if let first = sender.text {
            firstRow = first
        }
    }
    
    @IBAction func finishFirstRowTextField(_ sender: UITextField) {
         self.view.endEditing(true)
    }
    
    @IBAction func editingSecondRowTextView(_ sender: UITextField) {
        if let second = sender.text {
            secondRow = second
        }
    }
    
    @IBAction func finishSecondRowTextField(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    @IBAction func sendButtonTouch(_ sender: Any) {
        run()
    }
    
    func run() {
        self.view.endEditing(true)
        let userDefaults = UserDefaults.standard
        
        guard let host = userDefaults.string(forKey: defaultsKeys.host), !host.isEmpty else {
            self.navigationController?.view.makeToast("Stel eerst een host in!")
            return
        }
        let port = userDefaults.string(forKey: defaultsKeys.port)
        
        self.navigationController?.view.makeToastActivity(.center)
        
        let parameters: Parameters = ["first": self.firstRow ?? "","second": self.secondRow ?? ""]
        
        AF.request("\(host):\(port ?? "80")", method: .get, parameters: parameters).responseDecodable(of: LCDResponse.self) { (response) in
            self.navigationController?.view.hideToastActivity()
            self.navigationController?.view.makeToast(response.value?.message ?? "Er is iets fout gegaan!")
        }
    }
}


