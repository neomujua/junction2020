//
//  MenuTableViewController.swift
//  AskKey2
//
//  Created by Wonjun Lee on 2020/10/11.
//

import UIKit
import Firebase

class MenuListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countOfChildren: Int = 0
    var menus: [Menu] = []
    let menuReference = Database.database().reference(withPath: "menus")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuListCell", bundle: nil), forCellReuseIdentifier: "MenuListCell")
        tableView.delegate = self
        tableView.dataSource = self
        menuReference.observeSingleEvent(of: .value, with: { (snapshot) in self.countOfChildren = Int(snapshot.childrenCount)
            //print(self.countOfChildren)
            self.tableView.reloadData()
        }) { (error) in print(error.localizedDescription)}
        menuReference.observe(.value, with: { snapshot in
            var newMenus: [Menu] = []
            for child in snapshot.children {
                //print(child)
                //print(child as! DataSnapshot)
                let snap = child as! DataSnapshot
                let menu = Menu(snapshot: snap)
                newMenus.append(menu!)
                //print(menu)
                
            }
            //print(snapshot)
            self.menus = newMenus
            print(self.menus)
            self.tableView.reloadData()
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(self.countOfChildren)
        return countOfChildren
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell", for: indexPath) as! MenuListCell
        cell.menuTitle.text = menus[indexPath.row].title
        cell.menuContents.text = menus[indexPath.row].contents
        cell.menuPrice.text = menus[indexPath.row].price
        //print(menus)
        // Configure the cell...
        return cell
    }
}
