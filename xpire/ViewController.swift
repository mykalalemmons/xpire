//
//  ViewController.swift
//  xpire
//
//  Created by Mykala.Lemmons on 4/25/19.
//  Copyright © 2019 Mykala.Lemmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var makeupData: [String] = [" ",]
    
    @IBOutlet weak var makeupTableView: UITableView!
    
    @IBOutlet weak var addMakeup: UITextField!
    
    override func viewDidLoad() {
        makeupTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "makeupCell", for: indexPath )
        myCell.textLabel?.text = makeupData[indexPath.row]
        return myCell
    }
    
    @IBAction func sixMonthsButtonPressed(_ sender: Any) {
        makeupData.append(addMakeup.text ?? "oops")
        makeupTableView.reloadData()
    }
    
    @IBAction func twelveMonthsButtonPressed(_ sender: Any) {
        makeupData.append(addMakeup.text ?? "oops")
        makeupTableView.reloadData()
    }
}

