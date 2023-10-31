//
//  ViewController.swift
//  TwitterDemo
//
//  Created by Abhishek Rana on 30/10/23.
//

import UIKit

class ViewController: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImgView: UIImageView!
    
    var stuff: [String?] = ["abc", "nil", "def", nil, "qbwnkj", "jkl", nil, "jkl", "nil", nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if stuff[indexPath.row] != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell
            cell?.selectionStyle = .none
            cell?.btnShare.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
            cell?.btnShare.tag = indexPath.row
            return cell ?? UITableViewCell()
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextCell
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if stuff[indexPath.row] != nil {
            return 450
        } else {
            return 200
        }
    }
    
    @objc func connected(sender: UIButton) {
        shareTapped(sender: sender)
    }
}
