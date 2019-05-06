//
//  ViewController.swift
//  xpire
//
//  Created by Mykala.Lemmons on 4/25/19.
//  Copyright © 2019 Mykala.Lemmons. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    

    var makeupData: [String] = [" ",]
    
    @IBOutlet weak var makeupTableView: UITableView!
    
    
    @IBOutlet weak var addMakeup: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in })
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "makeupCell")
        let holderText = makeupData[indexPath.row]
        myCell!.textLabel!.text = holderText
        return myCell!
    }
    
    @IBAction func sixMonthsButtonPressed(_ sender: Any) {
        makeupData.append(addMakeup.text ?? "oops")
        makeupTableView.reloadData()
        sixMonths()
    }
    
    @IBAction func twelveMonthsButtonPressed(_ sender: Any) {
        makeupData.append(addMakeup.text ?? "oops")
        makeupTableView.reloadData()
        twelveMonths()
    }
    
    func sixMonths() {
        let content = UNMutableNotificationContent()
        content.body = "Something has expired!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func twelveMonths() {
        let content = UNMutableNotificationContent()
        content.body = "Something has expired!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
}

