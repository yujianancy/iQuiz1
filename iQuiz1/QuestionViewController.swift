//
//  QuestionViewController.swift
//  iQuiz1
//
//  Created by iGuest on 11/7/15.
//  Copyright © 2015 Jia Yu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var quesTxt: UILabel!
    
    @IBOutlet weak var options: UIPickerView!
    
    @IBOutlet weak var record: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var correctAns: UILabel!
    
    var sub:Int!
    
    var curQues:question!
    
    var curIndex:Int = 0
    
    var isQues:Bool = true
    
    var optionSelected:Int!
    
    var ansCorrect:Int = 0
    
    var isEnd:Bool = false
    
    @IBAction func clickNext(sender: AnyObject) {
        
        isQues = !isQues
        
        if (isEnd){
            
            self.performSegueWithIdentifier("back", sender: self)
        }
        
        if (isQues){
            
            curIndex = curIndex + 1
            
            if (curIndex <= subjects[sub].questions.count - 1){
                
                curQues = subjects[sub].questions[curIndex]
                
                quesTxt.numberOfLines = 0
                
                quesTxt.text = curQues.text
                
                correctAns.text = ""
                
                record.text = ""
                
                options.hidden = false
                
                options.delegate = self
                
                options.dataSource = self
                
            } else{
                
                if (ansCorrect == subjects[sub].questions.count){
                    
                    quesTxt.text = "Perfect!"
                    
                } else{
                    
                    quesTxt.text = "Almost!"
                    
                }
                
                quesTxt.font = UIFont(name: (quesTxt.font?.fontName)!, size: 30)
                
                correctAns.text = "That's all in this subject. Try another subject!"
                
                button.setTitle("Back", forState: .Normal)
                
                isEnd = true
                
            }

        } else{
            
            if (optionSelected == nil){
                
                optionSelected = 0
                
            }
            
            if (optionSelected == curQues.answer){
                
                ansCorrect = ansCorrect + 1
                
            }
            
            quesTxt.text = "Your answer is " + curQues.optionTxt[optionSelected]
            
            correctAns.text = "The correct answer is " + curQues.optionTxt[curQues.answer]
            
            record.text = "You've got " + String(ansCorrect) + " out of " + String(subjects[sub].questions.count) + " right!"
            
            options.hidden = true
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quesTxt.numberOfLines = 0
        
        curQues = subjects[sub].questions[curIndex]
        
        quesTxt.text = curQues.text
        
        options.delegate = self
        
        options.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return curQues.optionTxt[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return curQues.optionTxt.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        optionSelected = row
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
