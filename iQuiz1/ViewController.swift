//
//  ViewController.swift
//  iQuiz1
//
//  Created by Jia Yu on 11/3/15.
//  Copyright (c) 2015 Jia Yu. All rights reserved.
//

import UIKit

class subject{
    var title:String
    var description:String
    var image:UIImage
    
    init(title: String, description:String, imageName: String){
        self.title = title
        self.description = description
        self.image = UIImage(named: imageName)!
    }
}

var marvel = subject(title: "Marvel Heroes", description: "Test whether you're a real marvel fan!", imageName: "marvel")

var science = subject(title: "Science", description: "Test whether you're a real science geek!", imageName: "science")

var maths = subject(title: "Mathematics", description: "Test whether you're a real maths maniac!", imageName: "maths")


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSet(sender: AnyObject) {
        
        let setAlert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        setAlert.addAction(defaultAction)
        
        self.presentViewController(setAlert, animated: true, completion: nil)
    }
    
    
    var subjects:[subject] = [marvel, science, maths]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return subjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let sub = subjects[indexPath.row]
        cell.textLabel?.text = sub.title
        cell.detailTextLabel?.text = sub.description
        cell.imageView?.image = sub.image
        
        return cell
    }
    
    
}

