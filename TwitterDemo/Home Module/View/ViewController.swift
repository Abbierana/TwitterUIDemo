//
//  ViewController.swift
//  TwitterDemo
//
//  Created by Abhishek Rana on 30/10/23.
//

import UIKit

class ViewController: BaseVC {
    
    @IBOutlet weak var table_View: UITableView!
    @IBOutlet weak var profileImg_View: UIImageView!
    
    var stuff: [String?] = ["abc", "nil", "def", nil, "qbwnkj", "jkl", nil, "jkl", "nil", nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_View.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        table_View.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
    }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if stuff[indexPath.row] != nil {
            let cell = table_View.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            cell.selectionStyle = .none
            cell.btn_Share.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
            cell.btn_Share.tag = indexPath.row
            return cell
            
        } else {
            
            let cell = table_View.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if stuff[indexPath.row] != nil {
            return 450
        }else{
            return 200
        }
        
    }
    
    @objc func connected(sender: UIButton) {
        shareTapped(sender: sender)
    }
}
