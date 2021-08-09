//
//  ViewController.swift
//  PopupControllerDemo
//
//  Created by 郑志强 on 2021/3/7.
//

import UIKit


let cellId = "cellId"

class ViewController: UIViewController {
 
    let types = ["none","scale", "fade", "moveIn"]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PopupController"
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        cell.textLabel?.text = types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var type: PopupShowAnimator
        switch types[indexPath.row] {
        case "scale":
            type = .sacle
        case "fade":
            type = .fade
        case "moveIn":
            type = .moveIn
        default:
            type = .none
        }
        
       let presentedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PresentedViewController") as! PresentedViewController
                
//        let an = FadeShowAnimator(10)
//        PopupController.show(presentedVC, animation: an);
        PopupController.show(presentedVC, animationType: type)
    }
}
    
