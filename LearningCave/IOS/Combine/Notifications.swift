//
//  Notifications.swift
//  Tumble
//
//  Created by Shilpa M on 01/06/21.
//

import UIKit
import Combine

class Notifications: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //This publisher will listen for incoming notifications for the newBlogPost notification name.
        
        let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
             .map { (notification) -> String? in
                 return (notification.object as? BlogPost)?.title ?? ""
             }

         //create a lastPostTitleLabel which subscribes to the publisher.
         let lastPostLabel = UILabel()
         //The label is now a “Subscriber” to the notification “Publisher” and waits for new values to process.
         let lastPostLabelSubscriber = Subscribers.Assign(object: lastPostLabel, keyPath: \.text)
         blogPostPublisher.subscribe(lastPostLabelSubscriber)

        //Whenever a new blog post is “Published”, the label “Subscriber” will update its text value. 
         let blogPost = BlogPost(title: "Getting started with the Combine framework in Swift", url: URL(string: "https://www.avanderlee.com/swift/combine/")!)
         NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
         print("Last post is: \(lastPostLabel.text!)")
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

extension Notification.Name {
    static let newBlogPost = Notification.Name("Blog_Name")
}

struct BlogPost {
     let title: String
     let url: URL
 }
