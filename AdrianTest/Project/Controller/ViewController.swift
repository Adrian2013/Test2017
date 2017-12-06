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
    var tagsFilterResult:[Tags] = []
  
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
       
        if(searchActive){
            if self.tagsFilterResult.count > 0 {
                if let gifLink = self.tagsFilterResult[indexPath.row].image {
                    mediaCell.imgViewGif.downloadedFrom(link:gifLink)
                }else{
                    mediaCell.imgViewGif.image = UIImage(named:"defaultImg")
                }
                mediaCell.imgViewGif.contentMode = .scaleAspectFill
                mediaCell.imgViewGif.clipsToBounds = true
                mediaCell.imgViewGif.layer.cornerRadius = mediaCell.imgViewGif.frame.width / 2
            }
        }else{
            if let gifLink = self.tags[indexPath.row].image {
                mediaCell.imgViewGif.downloadedFrom(link:gifLink)
            }else{
                mediaCell.imgViewGif.image = UIImage(named:"defaultImg")
            }
            mediaCell.imgViewGif.contentMode = .scaleAspectFill
            mediaCell.imgViewGif.clipsToBounds = true
            mediaCell.imgViewGif.layer.cornerRadius = mediaCell.imgViewGif.frame.width / 2
        }
        return mediaCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return tagsFilterResult.count
        }
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tagsFilterResult = tags.filter({ (text) -> Bool in
            let tmp: NSString = text.searchterm! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(tagsFilterResult.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
}




