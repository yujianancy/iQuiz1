//
//  ViewController.swift
//  iQuiz1
//
//  Created by Jia Yu on 11/3/15.
//  Copyright (c) 2015 Jia Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var newTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didSelectButton(aButton: UIButton?) {
        print(aButton)
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


    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return subjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        
        let sub = subjects[indexPath.row]
        cell.textLabel?.text = sub.title
        cell.detailTextLabel?.text = sub.description
        cell.imageView?.image = sub.image
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "getQues"){
            
            let svc = segue.destinationViewController as! QuestionViewController
            
            let index = self.newTableView.indexPathForSelectedRow!.row
            
            svc.sub = index
        }
    }
    
    
}

