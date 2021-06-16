//
//  ViewController1.swift
//  Tumble
//
//  Created by Shilpa M on 12/02/21.
//

import UIKit
import Security

protocol changeBgColorDelegate {
    func changeBgColor(color : UIColor)
}

class ViewController2: UIViewController {
    
    var delegateIb : changeBgColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //example of storing data in keychain
        let keychainItem = [
          kSecValueData: "Pullip2020".data(using: .utf8)!,
          kSecAttrAccount: "andyibanez",
          kSecAttrServer: "pullipstyle.com",
          kSecClass: kSecClassInternetPassword,
          kSecReturnAttributes: true
        ] as CFDictionary

        var ref: AnyObject?

        let status = SecItemAdd(keychainItem, &ref)
        let result = ref as! NSDictionary
        print("Operation finished with status: \(status)")
        print("Returned attributes:")
        result.forEach { key, value in
          print("\(key): \(value)")
        }    }
    
    
    
    //delegate in IBAction
    @IBAction func btnChangeBgColor(_ sender: Any) {
        self.delegateIb?.changeBgColor(color: UIColor.blue)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnChangeBgColorRed(_ sender: Any) {
        self.delegateIb?.changeBgColor(color: UIColor.red)
        self.dismiss(animated: true, completion: nil)
    }
    
}
