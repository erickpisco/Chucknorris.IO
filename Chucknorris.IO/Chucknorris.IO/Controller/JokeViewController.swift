//
//  JokeViewController.swift
//  Chucknorris.IO
//
//  Created by erick pisco on 12/1/18.
//  Copyright © 2018 erick pisco. All rights reserved.
//

import UIKit
import Kingfisher

class JokeViewController: UIViewController {
    
    
    @IBOutlet weak var NaviItemTitle: UINavigationItem!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var lbJoke: UILabel!
    @IBOutlet weak var lbError: UILabel!
    @IBOutlet weak var btnError: UIButton!
    @IBOutlet weak var ivThumb: UIImageView!
    
    
    var info: [ChuckJokes] = []
    var category: String? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        loadJoke()
        NaviItemTitle.title = category
        lbError.text = "Someting went wrong..."
        lbError.isHidden = true
        btnError.isHidden = true
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        loading.startAnimating()
        lbError.isHidden = true
        btnError.isHidden = true
        loadJoke()
    }
    
    func loadJoke() {
        ChuckAPI.loadCategory(name: category) { (info) in
            if let info = info {
                self.lbJoke.text = info.value
                if let url = URL(string: info.icon_url) {
//                    self.ivThumb.kf.indicatorType = .activity
                    self.ivThumb.kf.setImage(with: url)
                    
                }else {
                    self.ivThumb.image = nil
                }
                self.loading.stopAnimating()
                self.loading.hidesWhenStopped = true
            } else {
                self.btnError.isHidden = false
                self.lbError.isHidden = false
                self.loading.stopAnimating()
                self.loading.hidesWhenStopped = true
            }
        }
    }
    

}
