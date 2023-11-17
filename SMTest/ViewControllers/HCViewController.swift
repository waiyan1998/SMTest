//
//  HCViewController.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/12/23.
//

import UIKit

class HCViewController: UIViewController {
    
    var hc : DataModel?
    var selected = [String]()
    
    
    
    @IBOutlet weak var CollectionView : UICollectionView!
    {
        didSet {
            CollectionView.dataSource = self
            CollectionView.delegate = self
            CollectionView.registerForCell(strID: HCCell.nibName)
           
        }
    }
    
    
    @IBOutlet weak var TableView : UITableView!
    {
        didSet {
            TableView.dataSource = self
            TableView.delegate = self
            TableView.registerForCell(strID: PCell.nibName)
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.CollectionView.allowsMultipleSelection = true
        let layout = CollectionView.collectionViewLayout as? AlignedCollectionViewFlowLayout
        layout?.horizontalAlignment = .left
        self.hc = Encode(DataModel.self, name: "Healthconcern" )
        self.CollectionView.reloadData()

        // Do any additional setup after loading the view.
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

extension HCViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hc?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HCCell.identifier, for: indexPath) as! HCCell
        cell.label.text = hc?.data?[indexPath.row].name ?? ""
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selected.append(hc?.data?[indexPath.row].name ?? "")
        self.TableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if let index = selected.firstIndex(where: { $0 ==  hc?.data?[indexPath.row].name ?? ""})
            {
                self.selected.remove(at: index)
            }
        self.TableView.reloadData()
       
    }
    

}


extension HCViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PCell.identifier, for: indexPath) as! PCell
            cell.Label.text = self.selected[indexPath.row]
        return cell 
    }
    
    
    
    
}
