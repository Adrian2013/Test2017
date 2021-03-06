//
//  BaseViewController.swift
//  AdrianTest
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let searchBar = UISearchBar()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUi()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    // MARK: - Cell
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func setupNavigationBar() {
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchBar)
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBarContainer
    }
    // MARK: - UI
    func setupUi(){
        setupNavigationBar()
        searchBar.placeholder = "search"
        searchBar.delegate = self
        tableView.separatorStyle = .none
        self.activityIndicator.hidesWhenStopped = true
    }
    
}

// MARK: - TableView
extension BaseViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(tableView, cellForRowAt: indexPath)
    }
    
    //MARK: Search bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    
    
}



class DismissSegue: UIStoryboardSegue {
    override func perform() {
        self.source.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

class PopSegue: UIStoryboardSegue {
    override func perform() {
        self.source.navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

