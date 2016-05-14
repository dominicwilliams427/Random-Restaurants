//
//  ViewController.swift
//  What to eat?
//
//  Created by Dominic Williams on 5/13/16.
//  Copyright © 2016 Dominic Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var inputRestaurantField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var restaurantsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.errorLabel.hidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addRestaurantPressed(sender: AnyObject) {
        if self.inputRestaurantField.text != ""{
            if self.errorLabel.hidden == false {
                self.errorLabel.hidden = true
            }
            self.restaurantsArray.append(self.inputRestaurantField.text!)
            self.inputRestaurantField.text = ""
        } else {
            self.errorLabel.hidden = false
        }
    }
    
    @IBAction func randomizeRestaurantPressed(sender: AnyObject) {
        
        if self.restaurantsArray.isEmpty != true {
            let randomIndex = Int(arc4random_uniform(UInt32(self.restaurantsArray.count)))
            self.restaurantLabel.text = self.restaurantsArray[randomIndex]
        }
        
    }

    func tap(gesture: UITapGestureRecognizer){
        self.inputRestaurantField.resignFirstResponder()
    }
}

