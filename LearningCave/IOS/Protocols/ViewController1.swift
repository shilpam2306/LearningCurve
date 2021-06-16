//
//  ViewController2.swift
//  Tumble
//
//  Created by Shilpa M on 12/02/21.
//

import UIKit


class ViewController1: UIViewController {
    
    //LogoDownloaded var
    var logoDownloader : LogoDownloader?
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LogoDownloaded set up call
        imageDownLoad()
    }
    
    //LogoDownload delegate setup
    func imageDownLoad() {
        // Construct a LogoDownloader to download
        logoDownloader = LogoDownloader(logoURL: "sdasd")
        
        // didFinishDownloading(_).
        logoDownloader?.delegate = self // try nil here
        
        
        // Start the logo image download and get informed when it
        // finished downloading when didFinishDownloading(_) is called.
        logoDownloader?.downloadLogo()
        
        // Since the delegating object, LogoDownloader, has an optional
        // reference to this class, ViewController, that reference can
        // be nil, and since we use optional chaining, ViewController
        // can run with or without the delegating object.
        if logoDownloader?.delegate == nil {
            view.alpha = 1.0
        }
    }
    
    @IBAction func btnChangeBgColor(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyBoard.instantiateViewController(identifier: "ViewController2") as! ViewController2
        viewController2.delegateIb = self
        self.present(viewController2, animated: true, completion: nil)
        
    }
}

extension ViewController1 : changeBgColorDelegate {
    func changeBgColor(color: UIColor) {
        view.backgroundColor = color
    }

}


//LogDownload delegate confirmed
extension ViewController1 : LogoDownloaderDelegate {
    
    func didFinishDownloading(_ sender: LogoDownloader) {
        let image = UIImage(systemName: "house")//default
        imageView = UIImageView(image: image!)
        imageView.backgroundColor = UIColor.red
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        imageView.image = logoDownloader?.image // downloaded image we get here after download is completed
    }
}
