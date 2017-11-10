//
//  ViewController.swift
//  TableViewExpandible
//
//  Created by Jorge MR on 09/08/17.
//  Copyright © 2017 Jorge MR. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [[String:String]]()
    var selectedIndex: IndexPath?
    var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        items = loadPlist()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didExpandCell(){
        isExpanded = !isExpanded
        tableView.reloadRows(at: [self.selectedIndex!], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.didExpandCell()
    }
    
    func loadPlist() -> [[String:String]]{
        let path = Bundle.main.path(forResource: "list", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }
    
    //Mark: Metodos de table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let item = items[indexPath.row]
        cell.titleLabel.text = item["title"]
        cell.shortLabel.text = item["short"]
        cell.thumbImage.image = UIImage.init(named: item["image"]!)
        cell.longLabel.text = item["long"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpanded && self.selectedIndex == indexPath {
            return 400
        }
        return 200
    }
    
    
    
    override var prefersStatusBarHidden: Bool { return true }
}

