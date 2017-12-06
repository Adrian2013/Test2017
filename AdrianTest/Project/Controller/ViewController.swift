//
//  ViewController.swift
//  AdrianTest
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import UIKit
import Alamofire

class ViewController:BaseViewController, UITableViewDelegate {
    
    //MARK: Property
    var tags:[Tags] = []
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiCall()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
    }
    
    // MARK: - TableView
    override func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mediaCell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaCell
        mediaCell.selectionStyle = .none

        mediaCell.imgViewGif.clipsToBounds = true
        if let gifLink = self.tags[indexPath.row].image {
            mediaCell.imgViewGif.downloadedFrom(link:gifLink)
        }else{
            mediaCell.imgViewGif.image = UIImage(named:"defaultImg")
        }
        
        return mediaCell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tags.count > 0 {
            return self.tags.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    //MARK: Api Call
    func apiCall(){
        _ = MediaManager.shared.getGifListWebservice(completion: { (media) in
            self.tags = media.tags!
            self.tableView.reloadData()
            print("Count",self.tags.count)
        }, failure: { (error) in
            print("Fail")
        })
    }
    
    
}


