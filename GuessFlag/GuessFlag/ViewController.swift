//
//  ViewController.swift
//  GuessFlag
//
//  Created by Ananas-Mac on 25/11/2015.
//  Copyright © 2015 Ananas-Mac. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountries()
        askQuestion(nil)
        setButtonDesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCountries() {
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    
    func askQuestion(action : UIAlertAction!) {
        self.countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        self.button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        self.button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        self.button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        self.correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        scoreLabel.text = "Score : \(score)"
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func setButtonDesign() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
    }

}

