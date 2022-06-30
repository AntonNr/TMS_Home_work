//
//  ViewController.swift
//  Home Work 17
//
//  Created by Антон Нарижный on 18.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var alertButton: UIButton!
    
    var alertView: AlertView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func didTapAlert(){
        let view = Bundle.main.loadNibNamed("AlertView", owner: nil, options: nil)?.first
        if let view = view as? AlertView{
            alertView = view
            alertView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            alertView?.isHidden = false
            self.view.addSubview(alertView!)
        }
    }
}

