//
//  AnswerViewController.swift
//  iQuiz1
//
//  Created by iGuest on 11/9/15.
//  Copyright © 2015 Jia Yu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var yansTxt: UILabel!
    
    @IBOutlet weak var corAns: UILabel!
    @IBOutlet weak var record: UILabel!
    
    @IBOutlet weak var button: UIButton!
    var yans:String!
    var optionSelected:Int!
    var ansCorrect:Int!
    var curQues:question!
    var sub:Int!
    var curIndex:Int!
    
    var isEnd:Bool = false
    @IBAction func clickNext(sender: AnyObject) {
        
        if (isEnd){
            
            self.performSegueWithIdentifier("back", sender: self)
        
        }
        
        curIndex = curIndex + 1
        
        if (curIndex <= subjects[sub].questions.count - 1){
            
            performSegueWithIdentifier("backToQues", sender: self)
            
        } else{
            
            if (ansCorrect == subjects[sub].questions.count){
                
                yansTxt.text = "Perfect!"
                
            } else{
                
                yansTxt.text = "Almost!"
                
            }
            
            yansTxt.font = UIFont(name: (yansTxt.font?.fontName)!, size: 30)
            
            corAns.text = "That's all in this subject. Try another subject!"
            
            button.setTitle("Back", forState: .Normal)
            
            isEnd = true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "backToQues"){
            
            let svc = segue.destinationViewController as! QuestionViewController
            
            svc.curIndex = curIndex
            
            svc.sub = sub
            
            svc.ansCorrect = ansCorrect
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yansTxt.text = "Your answer is " + curQues.optionTxt[optionSelected]
        
        corAns.text = "The correct answer is " + curQues.optionTxt[curQues.answer]
        
        record.text = "You've got " + String(ansCorrect) + " out of " + String(subjects[sub].questions.count) + " right!"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
