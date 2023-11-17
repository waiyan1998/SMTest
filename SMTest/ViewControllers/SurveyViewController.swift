//
//  SurveyViewController.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/13/23.
//

import UIKit

class SurveyViewController: UIViewController {
    @IBOutlet var CurrentSmoke_RBGRoup: [UIButton]!
    @IBOutlet var AverageDrinkAl_RBGroup: [UIButton]!
    @IBOutlet var DailyEx_RBGroup: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DailyEx_RBSelect(_ sender: UIButton) {
        for btn in DailyEx_RBGroup  {
            btn.setImage(UIImage(named: "radio_unselect"), for: .normal)
        }
        sender.setImage(UIImage(named: "radio_selected"), for: .normal)
        
    }
    
    @IBAction func AverageDrinkAl_RBSelect(_ sender: UIButton) {
        for btn in AverageDrinkAl_RBGroup  {
            btn.setImage(UIImage(named: "radio_unselect"), for: .normal)
        }
        sender.setImage(UIImage(named: "radio_selected"), for: .normal)
        
    }
    
    
    @IBAction func CurrentSmoke_RBSelect(_ sender: UIButton) {
        for btn in CurrentSmoke_RBGRoup  {
            btn.setImage(UIImage(named: "radio_unselect"), for: .normal)
        }
        sender.setImage(UIImage(named: "radio_selected"), for: .normal)
        
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
