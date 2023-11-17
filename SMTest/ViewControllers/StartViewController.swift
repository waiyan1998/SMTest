//
//  ViewController.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/12/23.
//

import UIKit

class getMyVitamin {
    var hc : [String]?
    var diet : String?
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


func Encode<T :Codable> ( _ type : T.Type , name : String )->T?
{
    do {
       if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
       let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
           let results  = try! JSONDecoder().decode(T.self, from: jsonData)
           return results
       }
    } catch {
        return nil
       print(error)
    }
    return nil
}

