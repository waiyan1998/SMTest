//
//  ASViewController.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/13/23.
//

import UIKit

class ASViewController: UIViewController {

    var search_str  = ""
    {
        didSet{
           
            search_results = allergies?.data?.filter{ ($0.name?.lowercased() ?? "")?.contains(search_str.lowercased()) ?? false}.map{$0.name ?? ""} ?? []
            self.TableView.reloadData()
           
        }
    }
    var search_results = [String]()
    
    @IBOutlet weak var TF: textField!
    
    var allergies = Encode(DataModel.self, name: "allergies")
    
    @IBOutlet weak var TableView : UITableView!{
        didSet {
            self.TableView.delegate = self
            self.TableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TF.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func BackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ASViewController : UITextFieldDelegate{
    
 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let TF = textField as? textField , let str = TF.text
        {
            self.search_str = str
            print(self.allergies)
            print(self.search_results)
        }
        return true
   }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        
        if TF.str_count == 3
        {
            TF.isUserInteractionEnabled = false
            TF.text = ""
            self.search_str = ""
        }
        
        

    }
    
    
    
}



class textField : UITextField
{
    
    var str_count  = 0
    
    var stackView = UIStackView()
    
    func createLabel( _ str : String)->UILabel
    {
        let l = PaddingLabel()
        l.topInset = 5
        l.leftInset = 8
        l.rightInset = 8
        l.bottomInset = 5
        l.text = str
        l.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        l.backgroundColor = UIColor(hexString: "3A4B65")
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 15
        l.textColor = .white
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        l.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        return l
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 5
       
    }
    
    func addItem(_ str : String )
    {
        
        let label = createLabel(str)
        self.stackView.addArrangedSubview(label)
        self.leftView    = stackView
        self.leftViewMode = .always
        self.str_count += 1
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10 , bottom: 0 , right: 0 ))
    }

    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: self.stackView.frame.width + 5  , bottom: 0, right: 0 ))
    }
   
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        super.leftViewRect(forBounds: bounds)
    }
     
}


extension ASViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.search_results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = self.search_results[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.TF.addItem(self.search_results[indexPath.row])
            self.TF.text = ""
            self.search_str = ""
            self.TF.endEditing(true)
            
        
        
    }
    
    
    
    
    
}
