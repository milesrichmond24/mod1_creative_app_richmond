//
//  ViewController.swift
//  mod1_creative_app_richmond
//
//  Created by MILES RICHMOND on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Label because it looks cool
    @IBOutlet weak var description_output_outlet: UILabel!
    
    // User provided info
    @IBOutlet weak var base_output_outlet: UITextField!
    @IBOutlet weak var input_outlet: UITextField!
    
    @IBOutlet weak var output_outlet: UILabel!
    
    
    let base_values: [String] = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func convert(num: String, base: Int) -> String {
        if(base > 16 || base < 2) {
            return "invalid input";
        }
        
        if(num == "0") {
            return "";
        }
        
        var num2: Int = 0;
        
        if(num != "") {
            if(Int(num) == nil) {
                return "";
            }
            num2 = Int(num)!;
        }
        
        
        return "\(convert(num: String((num2 - (num2 % base)) / base), base: base) + base_values[num2 % base])"
    }
    
    
    @IBAction func convert_action(_ sender: UIButton) {
        let input = input_outlet.text ?? "";
        
        var base: Int = 0;
        
        
        if(Int(base_output_outlet.text!) == nil) {
            return;
        }
        base = Int(base_output_outlet.text!)!;
        
        output_outlet.text = convert(num: input, base: base)
        
        description_output_outlet.text = String(base);
        
    }
    
    
    
}

