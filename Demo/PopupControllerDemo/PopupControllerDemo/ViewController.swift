//
//  ViewController.swift
//  PopupControllerDemo
//
//  Created by 郑志强 on 2021/3/7.
//

import UIKit

class CellModel {
    
    var title: String
    var type: PopupAnimationType
    
    init(title: String, type: PopupAnimationType) {
        self.title = title
        self.type = type
    }
}


extension PopupAnimationType: CaseIterable {
    public static var allCases: [PopupAnimationType] {
        return [.fade, .scale, .moveIn, .none]
    }
}

let cellId = "cellId"

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        }
    }
    
    var cellModels = [CellModel]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PopupController"
        
        cellModels = PopupAnimationType.allCases.map({ type in
            return CellModel(title: "\(type)", type: type)
        })
        self.tableView.reloadData()
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        let model = self.cellModels[indexPath.row]
        cell.textLabel?.text = model.title
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = self.cellModels[indexPath.row].type
//        let presentedVC = PresentedViewController()
       let presentedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PresentedViewController") as! PresentedViewController        
        presentedVC.animationType = type == .moveIn ? .moveOut : type
        PopupController.show(presentedVC, animationType: type)
    }
}
    
