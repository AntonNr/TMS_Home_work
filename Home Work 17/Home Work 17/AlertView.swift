import Foundation
import UIKit

class AlertView: UIView {
    @IBOutlet var centerView: UIView!
    @IBOutlet var okButton: UIButton!
    
    func boldOfButton(){
        okButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    @IBAction func closeAlert(){
        self.removeFromSuperview()
    }
}


