//
//  DietViewController.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/13/23.
//

import UIKit

class DietViewController: UIViewController {
    
    @IBOutlet var checkbox_gp: [UIButton]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CheckBox_Select(_ sender: UIButton) {
        print(sender.tag)
        for btn in checkbox_gp {
           btn.setImage(UIImage(named: "icon_checkbox_unselect"), for: .normal)
           
        }
        sender.setImage(UIImage(named: "icon_checkbox_selected"), for: .normal)
    }
    
    
    @IBAction func BackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
