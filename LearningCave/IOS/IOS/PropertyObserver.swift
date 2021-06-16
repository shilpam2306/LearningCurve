//
//  PropertyObserver.swift
//  Tumble
//
//  Created by Shilpa M on 16/06/21.
//

import Foundation
import Queue // assume

//lets assume we have a queue name demo and which recieves meesage from various users. implement listener as soon a new message is sent it prints put the message

class Demo {

  var portNumber: Int16
  var userName: String
  var password: String
  var queue: Queue? {
    didSet {
      printListenerMessage()
    }
  }
  
  init(portNumber: Int16, userName: String, password: String) {
    self.portNumber = portNumber
    self.userName = userName
    self.password = password
  }
  
  private func printListenerMessage() {
    let message = """
    The queue is running on port : \(portNumber)
    Username : \(userName)
    Password : \(password)
    """
    print(message)
  }
}

// In Main.swift
let demoApp = Demo.init(portNumber: 8161, userName: "admin", password: "admin")
demoApp.queue = Queue()
