//
//  CategoriesTableViewController.swift
//  Chucknorris.IO
//
//  Created by erick pisco on 12/1/18.
//  Copyright © 2018 erick pisco. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    var listCategories: [String] = []
    private let refresh = UIRefreshControl()
    var loading: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshList()
        loading.text = "Loading categories..."
        
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refresh
        } else {
            tableView.addSubview(refresh)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
        
    }
    
    
    func refreshList () {
        
        refresh.tintColor = UIColor.black
        refresh.addTarget(self, action: #selector(loadList), for: .valueChanged)
    }
    
    @objc func loadList() {
        load()
        loading.text = "Loading categories..."
    }
    
    
    func load()  {
        ChuckAPI.loadCategories { (reponse) in
            if reponse .isEmpty {
                self.refresh.endRefreshing()
                self.listCategories.removeAll()
                self.tableView.reloadData()
                self.loading.text = "The network connection is lost"
            }else {
                self.listCategories = reponse
                DispatchQueue.main.async {
                    self.refresh.endRefreshing()
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! JokeViewController
        vc.category = listCategories[tableView.indexPathForSelectedRow!.row]
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = listCategories.count == 0 ? loading : nil
        
        return listCategories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoriesTableViewCell
        
        let category = listCategories[indexPath.row]
        cell.prepareCell(with: category)
        
        
        
        return cell
    }
    
}
